<?php

defined('K_PATH') or die('DIRECT ACCESS IS NOT ALLOWED');

class Admin_Controller_AclUser extends Controller {

    private $dictionary=array(
       'user_name'=>'Имя',
       'user_login'=>'Логин',   
       'user_password'=>'Пароль',   
       'user_email'=>'Email',        
    );
    
    public function onInit() {
                $this->formDictionary = new K_Dictionary();
                $this->formDictionary->loadFromIni( ROOT_PATH.'/configs/forms/errors.txt');
                K_Validator::setDefaultDictionary( $this->formDictionary );
         }      


    public function saveAction() {
        $returnJson = array();
        $returnJson['error'] = false;
        $userModel = new Admin_Model_User();
        $data = array(
            'user_name' =>trim ($_POST['user_name']),
            'user_login' =>trim ($_POST['user_login']),
            'user_email' =>trim ($_POST['user_email']),
            'user_password' =>trim ($_POST['user_password'])
            );

        $validate = array(
            'user_name' => array('required' => true),
            'user_login' => array('required' => true, 'userExists'),
            'user_password' => array('pwdTest'),
            'user_email' => array(
                'required' => true,
                'lengthTest',
                'email',
                'userExists'));

        if ($_POST['save_type'] == 'update') {
                $data['user_id'] = $_POST['user_id'];
                $validate['user_login'][0] = 'userExistsUpdate';
                $validate['user_email'][2] = 'userExistsUpdate';
                $validate['user_password'][0]= 'pwdTestUpdate';
        }
      
          if ($userModel->isValidRow($data,$validate)) {
           if ($_POST['save_type'] == 'add') {
                $data['user_password'] = md5(md5($data['user_password'] . K_Registry::get('Configure.salt')));
                $user_id = $userModel->save($data);
                $returnJson['user']['type'] = 'add';
                $returnJson['user']['id'] = $user_id;
            } else
                if ($_POST['save_type'] == 'update') {
                    if(mb_strlen($data['user_password'])>0){
                     $data['user_password'] = md5(md5($data['user_password'] . K_Registry::get('Configure.salt')));   
                        
                    }else{
                        unset($data['user_password']);
                    }
                    $user_id = $userModel->update($data, array('user_id' => (int)$_POST['user_id']));
                    $returnJson['user']['type'] = 'update';
                    $user_id = intval($_POST['user_id']);
                    $returnJson['user']['id'] = $_POST['user_id'];
                }

            $userRolesModel = new Admin_Model_UserRole;
            $userRolesModel->remove(K_Db_Select::create()->where(array('usrol_user_id' => $user_id)));

            if (isset($_POST['roles']) && count($_POST['roles']) > 0){
                foreach ($_POST['roles'] as $v) {
                    $rd['usrol_user_id'] = $user_id;
                    $rd['usrol_role_id'] = intval($v);
                    $rolesData[] = $rd;
                }
                $userRolesModel->saveAll($rolesData);
                $returnJson['user']['roles'] = $_POST['roles'];
            }

            $returnJson['user']['name'] = $data['user_name'];
            $returnJson['user']['login'] = $data['user_login'];
            $returnJson['user']['email'] = $data['user_email'];
            $returnJson['error']=false;  
            $returnJson['msg']="<strong>OK:</strong>Пользователь удачно сохранён";
        } else {
            $returnJson['error'] = true;
            $returnJson['msg']=$userModel->getErrorsD($this->dictionary);
         }
        $this->putJSON($returnJson);
    }

    public function delAction() {
        $userModel = new Admin_Model_User;
        $user_id=intval($_POST['delusrid']);
        $userModel->removeID($user_id);

        $userRolesModel = new Admin_Model_UserRole;

        $userRolesModel->remove(K_Db_Select::create()->where(array('usrol_user_id' => $user_id)));

        $returnJson = array('error' => false,
                             'msg'  => '<strong>OK:</strong>Пользователь удалён');
       $this->putJSON($returnJson);
    }
    
    public function loadAction() {
        $userModel = new Admin_Model_User;
        $page=intval($_POST['page']);
        $onPage=intval($_POST['onPage']);
        $filter=$_POST['filter'];
    
        if($page){  
            if (!$onPage){
               $onPage=10;  
            }
            
            $start = $page * $onPage - $onPage;
       
        }else
        {
            $start = 0;
            $page = 1;
            $onPage=10;
        }
        
        $where='WHERE 1=1';
        
        if($filter){
          $where ="WHERE user_name like ".K_Db_Quote::quote($filter.'%');
        }
        
        $query = new K_Db_Query; 
        $sql = "SELECT SQL_CALC_FOUND_ROWS u.*, (SELECT GROUP_CONCAT(role_name SEPARATOR ', ') as user_roles FROM users_roles ur left join role  on ur.usrol_role_id=role_id WHERE ur.usrol_user_id = u.user_id) as user_roles FROM users u  
                $where order by user_name LIMIT $start, $onPage";
  
        $usersRes = $query->q($sql);  
              
        $sql ="SELECT FOUND_ROWS() as countItems;";
        $countItems = $query->q($sql);   
        $countItems=$countItems[0]['countItems'];
        
           $users=array();         
             foreach($usersRes as $v){
   
              $id=$v['user_id'];
              $userRow['name']=$v['user_name'];
              $userRow['login']=$v['user_login'];
              $userRow['email']=$v['user_email'];
              $userRow['roles']=$v['user_roles']==null ? '' : $v['user_roles'];
              $users[$id]=$userRow;       
             }        
          
        $returnJson = array('error' => false,
                            'items'=>$users,
                            'countItems'=>$countItems
                           );
  
        $this->putJSON($returnJson);
    }

}
