<?php

defined('K_PATH') or die('DIRECT ACCESS IS NOT ALLOWED');

class Admin_Controller_Objects extends Controller {
   
    protected function indexAction() {
   	    $this->view->title = 'Просмотр Комментариев';
		$this->view->headers =array(
                                   array('title'=>'Объекты',
                                   )
                              );
                              
        $this->view->bigtable = true;
        
        $query = new K_Db_Query;
        
        $this->view->types = $query->q('SELECT name, id from obj_types ORDER BY name', true);
      
        $this->view->filials = $query->q('SELECT title, id from obj_branches ORDER BY title', true);
        
        $this->render('objects');  
    }

    public function loadAction() {
      
        $page = intval($_POST['page']);
        $onPage = intval($_POST['onPage']);
 
        $searche = $_POST['filter'];
        $blogId = intval($_POST['blogid']);
        
        if ($dateStart = K_Date::dateParse($_POST['date-start'])) {
            $dateStart =  mktime(0,0,0, $dateStart['m'], $dateStart['d'], $dateStart['y']);
        }
        if ($dateStop = K_Date::dateParse($_POST['date-stop'])) {
            $dateStop =  mktime(23,59,59, $dateStop['m'], $dateStop['d'], $dateStop['y']);
        }
        
        if(is_numeric($_POST['price-start'])){
            
            $priceStart = $_POST['price-start'];
            
         }
        
        
        if(is_numeric($_POST['price-stop'])){
           
            $priceStop = $_POST['price-stop'];
            
        }
        
        if ($page) {

            if (! $onPage) {
                $onPage = 10;
            }

            $start = $page * $onPage - $onPage;

        } else {
            $start = 0;
            $page = 1;
            $onPage = 10;
        }
        
        $where = '';
        
        // перечень полей из пост запроса для проверки
        $fields = array('id'=>'o.id',
                        'idc1'=>'o.idc1',
                        'type'=>'o.type',
                        'filial'=>'o.filial',
                        'adres'=>'o.adres',
                        'comnati'=>'o.comnati'
                        );
                        
        $where = K_Afunc::where($fields,$_POST);              
        
        
      //  var_dump($where);                
                        
      
        // цена объекта 
         if ($priceStart && $priceStop) {
            if ($priceStart > $priceStop) {
                
                $where[] ="UNIX_TIMESTAMP(o.price) >= ".K_Db_Quote::quote($priceStart);
                
            } else {
                
                $where[] ="(UNIX_TIMESTAMP(o.price) BETWEEN  ".K_Db_Quote::quote($priceStart)." AND ".K_Db_Quote::quote($priceStop).")";
                
            }
        } else
        if ($priceStart) {
            $where[] ="UNIX_TIMESTAMP(o.price) >= ".K_Db_Quote::quote($priceStart);
        } else
        if ($priceStop) {
            $where[] ="UNIX_TIMESTAMP(o.price) <= ".K_Db_Quote::quote($priceStop);
        }
        
        // дата публикации объекта
         if ($dateStart && $dateStop) {
            if ($dateStart > $dateStop) {
                $where[] ="UNIX_TIMESTAMP(o.date_publication) >= ".K_Db_Quote::quote($dateStart);
            } else {
                 $where[] ="(UNIX_TIMESTAMP(o.date_publication) BETWEEN  ".K_Db_Quote::quote($dateStart)." AND ".K_Db_Quote::quote($dateStop).")";
            }
        } else
        if ($dateStart) {
            $where[] ="UNIX_TIMESTAMP(o.date_publication) >= ".K_Db_Quote::quote($dateStart);
        } else
        if ($dateStop) {
            $where[] ="UNIX_TIMESTAMP(o.date_publication) <= ".K_Db_Quote::quote($dateStop);
        }
        
        if ($where && count($where)) {
            $where = ' WHERE ' . implode(' AND ', $where);
        }
        
        $query = new K_Db_Query;
        
        $sql = "SELECT SQL_CALC_FOUND_ROWS o.*, b.symbol letter, t.name typename, t.color color, o.branchID filial_info, b.symbol letter, b.phone, b.address, b.email, b.title filial FROM `obj_objects` o
                 
                    LEFT JOIN obj_rooms r ON r.id = o.id 
                    LEFT JOIN obj_types t ON t.id = o.type 
                    LEFT JOIN obj_branches b ON b.id = o.branchID 
                    
                $where ORDER BY date_publication DESC LIMIT $start, $onPage";

        $itemsRes = $query->q($sql);

        $sql = "SELECT FOUND_ROWS() as countItems;";
        $countItems = $query->q($sql);
        $countItems = $countItems[0]['countItems'];

        $items = array();
       
        // сделать вывод планировок.
        // var_dump($itemRow);
        
        $this->view->objectRow = $itemRow;
     
        foreach ($itemsRes as $v) {
            
            $itemRow['id'] = $v['id'];
            $itemRow['id1c'] = $v['id1c'];
            $itemRow['type'] = $v['typename'];
            $itemRow['filial'] = strip_tags(htmlspecialchars ($v['filial']));
            $itemRow['adress'] = strip_tags($v['city'].' '.$v['city'].' '.$v['street']);
            $itemRow['rooms'] = strip_tags(htmlentities($v['rooms']));
            $itemRow['price'] = $v['price'];
            $itemRow['color'] = strtoupper($v['color']);
          
            $items[] = $itemRow;
            
        }

        $returnJson = array(
            'error' => false,
            'items' => $items,
            'countItems' => $countItems
            );

        $this->putJSON($returnJson);
    }
    
    
     public function editAction() {
        
        $this->disableLayout = true;
        
        $id = intval($_GET['objectid']); 
         
        $query = new K_Query;
      
        $itemModel = new Admin_Model_Object;
      
        $itemRow = $itemModel->mfr("SELECT o.*, b.symbol letter, t.name typename, o.branchID filial_info, b.symbol letter, b.phone, b.address, b.email  FROM `obj_objects` o 
                                        LEFT JOIN obj_rooms r ON r.id = o.id
                                        LEFT JOIN obj_types t ON t.id = o.type
                                        LEFT JOIN obj_branches b ON b.id = o.branchID 
                                    WHERE o.id='".$id."'");
   
        $this->view->regions = $query->q('select title as t from obj_regions WHERE city LIKE "г.Одесса" order by t',true);
    
        // сделать вывод планировок.
        // var_dump($itemRow);
        $this->view->objectRow = $itemRow;
       
        $this->render('edit');        
     } 
     
    
    public function saveAction(){
        
        $itemId = intval($this->getParam('id'));  
   
        $nameAccos = array(
                    'orient' => 'Название ЖК',
                    'order' => 'Очередность',
                    'region' => 'Район',
                    'street' => 'Улица',
                    'price' =>  'Цена',
                    'url' => 'Прямая ссылка',
                    'descr' => 'Описание',
                    'seo_title' => 'Заголовок страницы [TITLE]',
                    'seo_desc' => ' Описание [DESCRIPTION]',
                    'seo_keys' => ' Ключи [KEYWORDS]'
                  );
        
        $data = array( 
                        'orient' => trim($_POST['orient']),
                        'orders' => intval(trim($_POST['order'])),
                        'region' => trim($_POST['region']),
                        'street' => trim($_POST['street']),
                        'price' => trim($_POST['price']),
                        'url' => trim($_POST['url']),
                        'descr' => trim($_POST['descr']),
                        'seo_title' => trim($_POST['seo_title']),
                        'seo_desc' => trim($_POST['seo_desc']),
                        'seo_keys' => trim($_POST['seo_keys'])
                        
                      );
                      
       
        $validate = array('orient' => array(
                                      
                                   
                                        ),
         
                          'orders' => array(
                                         'numeric',
                                        ),
                                    
                          'region' => array(
                                      
                                        ),
                                        
                          'street' => array(
                                      
                                        ),
                                        
                          'price' => array(
                                      
                                        ),
                          'url' => array(
                                      
                                        ),
                          'descr' => array(
                                     
                                        ),    
                          'seo_title' => array(
                                        'maxlen'=>255
                                        ),  
                          'seo_desc' => array(
                                        'maxlen'=>750
                                        ),       
                          'seo_keys' => array(
                                        'maxlen'=>255
                                        )                                                  
                                                                      
                          );
           
        $itemModel = new Admin_Model_Object;
        
        if ($itemModel->isValidRow($data, $validate)){
          
            if( $itemId){
                 
                $itemModel->update($data,'id='.$itemId);
                 
            }else{
                
                $itemModel->save($data);
                
            }
           
            $jsonReturn['error'] = false;
            $jsonReturn['msg'] = 'Данные сохранены';
       
        } else {
       
            $jsonReturn['error'] = true;
            $jsonReturn['msg'] = $itemModel->getErrorsD($nameAccos);
      
        }
        
        $this->putJSON($jsonReturn);
  }

  public function removeAction(){
    
        $itemModel = new Admin_Model_Object;
        $id = intval($_POST['objectid']);
     
        if($id){
            $itemModel->removeID($id);
            $this->putJSON(array('error' => false));
        }else{
            $this->putJSON(array('error' => true, 'msg' =>'Неправильный индитификатор'));
        }
        
   }

}
