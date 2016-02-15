<?php

class Ajax_Controller_Index extends Controller {

    public function onInit() {
        $this->formDictionary = new K_Dictionary();
        $this->formDictionary->loadFromIni(ROOT_PATH . '/configs/forms/errors.txt');
        K_Validator::setDefaultDictionary($this->formDictionary);
    }

    public function indexAction() {
        
        $this->disableRender = true;

        $method = $this->getParam(2);
        
        //убираем гет строку  
                $qpos = strpos($method,'?');
                if ($qpos) {
                    $method = substr($method, 0, strpos($method, '?'));
                }
                 
        if ($method) {
            $this->{$method}();
        }
        
    }
    
    
    public function ask() {
              
        if (! K_Request::isPost()){
            $this->putAjax('ERROR');
        }
        
       // var_dump( $_POST['capcha']);var_dump(K_Auth::getUserInfo('capchaText'));
      
        if(strcasecmp(trim($_POST['capcha']), K_Auth::getUserInfo('capchaText'))!=0 || time()-300 > K_Auth::getUserInfo('capchaTime')){
 
           $jsonReturn['error'] = true;
           $jsonReturn['msg'] = array(1=>array('label'=> t('Символы с картинки','Символи з картинки'),'error'=>t('Неправильно введён код с картинки !!!','Неправильно введений код з малюнка !!!')));
     
           $capchaText = K_Secur::genCapchaText();
           
           K_Auth::setUserKey('capchaText',$capchaText);
           K_Auth::setUserKey('capchaTime',time());
    
           $jsonReturn['callback']='function callback(){$("#captcha-img").attr("src","data:image/png;base64,'.K_Secur::genCapcha($capchaText).'");$("#capcha-text").val("")}';
          
           if (K_Request::isAjax()) {
               $this->putJSON($jsonReturn);
           } else {
               K_Request::redirect('/');
           } 
              
        }
        
        $nameAccos = array(
        
                    'userName' => t('Ваше имя:',"Ваше ім'я:"),
                    'userContact' => t('Ваш E-mail*:','Ваш E-mail*:'),
                    'userPhone' => t('Ваш Телефон*:','Ваш Телефон*:'),
                    'userMessage' => t('Ваше сообщение:','Ваше повідомлення:'),
                  
                  );
                
        $data = array(
        
                'userName' => trim($_POST['userName']),
                'userContact' => trim($_POST['userContact']),
                'userPhone' => trim($_POST['userPhone']),
                'userMessage' => trim($_POST['userMessage']),
                'manager_email' => trim($_POST['manager_email'])
                
                );
                
          $managers = K_TreeQuery::crt('/manager/')->types('manager')->go();     
          foreach($managers as $v){
                        
            $managerMails[]=$v['email'];
            
          }      
          
       
        $validate = array('userName' => array(
                                        'maxlen' => 255,
                                        ),
                               
                          'userContact' => array(
                                        'required' => true,
                                        'notEmpty',
                                        'email'
                                        ),
                                               
                          'userPhone' => array(
                                        'required' => true,
                                        'notEmpty',
                                        'phone'
                                        ),
                                               
                          'userMessage' => array(
                                        'required' => true,
                                        'notEmpty',
                                        'maxlen' => 1500,
                                        ),
                          'manager_email' => array(
                                        'required' => true,
                                        'notEmpty',
                                        'enum' => $managerMails
                                        ),
                          );
                         
                          
        $commentModel = new Admin_Model_Valid;
        
        if ($commentModel->isValidRow($data, $validate)){
            
            $jsonReturn['error'] = false;
            $jsonReturn['msg'] =t("Ваш вопрос был отправлено успешно. Спасибо.","Ваше питання було надіслано успішно. Спасибi.");
            $jsonReturn['clean'] = true;
		
			//Send mail
			///////////////////////////////////////////////////////////////////
            
			$toMail = strip_tags(trim($data['manager_email']));
        	$mailText= 'Вам на сайт добавили вопрос. /r /n';
           	$mailText.= 'Имя:'.strip_tags($data['userName']).' /r /n';
           	$mailText.= 'E-mail:'.strip_tags($data['userContact']).' /r /n';
           	$mailText.= 'Телефон:'.strip_tags($data['userPhone']).' /r /n';
           	$mailText.=' Сообщение: /r /n'.strip_tags($data['userMessage']);
            			
            $mailer = new K_mail;
			$mailer->setBody($mailText);
			$mailer->addTo($toMail);
			$mailer->send('noreply@cleaning.loc', 'На ваш сайт добавили новый вопрос');

			////////////////////////////////////////////////////////////////
        
       } else {
            
            $jsonReturn['error'] = true;
            $jsonReturn['msg'] = $commentModel->getErrorsD($nameAccos);
        }
        
        if (K_Request::isAjax()) {
            
            $this->putJSON($jsonReturn);
            
        } else {
            
            K_Request::redirect('/');
            
        } 
        
     
     }   
     
     public function price() {
              
        if (! K_Request::isPost()){
            $this->putAjax('ERROR');
        }
        
        $nameAccos = array(
        
                    'name' => t('Ваше имя:',"Ваше ім'я:"),
                    'city' => t('Ваш город:','Ваш город:'),
                    'email' => t('Ваш E-mail*:','Ваш E-mail*:'),
                    'type' => t('Тип конструкции*:','Тип конструкції*:'),
                    'phone' => t('Ваш Телефон*:','Ваш Телефон*:'),
                    'message' => t('Ваше сообщение:','Ваше повідомлення:'),
                  
                  );
                
        $data = array(
        
                'name' => trim($_POST['name']),
                'city' => trim($_POST['city']),
                'type' => trim($_POST['type']),
                'phone' => trim($_POST['phone']),
                'email' => trim($_POST['email']),
                'message' => trim($_POST['message'])
                
                );
       
        $validate = array('name' => array(
                                        'maxlen' => 255,
                                        ),
                               
                          'email' => array(
                                        'required' => true,
                                        'maxlen' => 255,
                                        'notEmpty',
                                        'email'
                                        ),
                                               
                          'phone' => array(
                                        'required' => true,
                                        'notEmpty',
                                        'phone'
                                        ),
                                        
                          'type' => array(
                                        'required' => true,
                                        'notEmpty',
                                        'enum' => array('Двери из стекла',
                                                        'Перегородки из стекла',
                                                        'Фасады',
                                                        'Козырьки из стекла',
                                                        'Лестницы из стекла',
                                                        'Стеклянный пол',
                                                        'Душевые кабины',
                                                        'Автоматика',
                                                        'Фурнитура')
                                        ),
                                                                 
                          'message' => array(
                                        'required' => true,
                                        'notEmpty',
                                        'maxlen' => 1500,
                                        ),
                          );
                          
        $commentModel = new Admin_Model_Valid;
        
        if ($commentModel->isValidRow($data, $validate)){
            
            $jsonReturn['error'] = false;
            $jsonReturn['msg'] = t("Ваше сообщение было отправлено успешно. Спасибо.","Ваше повідомлення було відправлено успішно. Спасибі.");
            $jsonReturn['clean'] = true;
		
			//Send mail
			///////////////////////////////////////////////////////////////////
                  
			$toMail = trim($_POST['manager_email']);
            
			$mailText=  'На сайте glassok.ua была заполненна форма "Узнать стоимость" . /r /n';
           	$mailText.= 'Имя:'.strip_tags($data['name']).' /r /n';
           	$mailText.= 'E-mail:'.strip_tags($data['email']).' /r /n';
           	$mailText.= 'Телефон:'.strip_tags($data['phone']).' /r /n';
           	$mailText.= 'Тип конструкции:'.strip_tags($data['type']).' /r /n';
           	$mailText.= 'Сообщение: /r /n'.strip_tags($data['massage']);
            			
            $mailer = new K_mail;
			$mailer->setBody($mailText);
			$mailer->addTo($toMail);
            
			$mailer->send('noreply@glassok.ua', 'На сайте glassok.ua была заполненна форма "Узнать стоимость"');

			////////////////////////////////////////////////////////////////
        
        } else {
            
            $jsonReturn['error'] = true;
            $jsonReturn['msg'] = $commentModel->getErrorsD($nameAccos);
      
        }
        
        if (K_Request::isAjax()) {
            $this->putJSON($jsonReturn);
        } else {
            K_Request::redirect('/');
        } 
    }   
    
     
       
    // Отдаёт детей ноды, необходимо для каскадных селектов

    public function loadChilds() {
        $nodeChilds = array();
        $treeid=intval($_POST['treeid']);
        
        if ($treeid) {
            $nodeChilds = K_Tree::getChilds($treeid);
        }

        $field = 'tree_' . $_POST['field'];
        $returnJSON = array();
        foreach ($nodeChilds as $v) {
            $id = $v['tree_id'];
            $child['title'] = $v["tree_title"];
            $child['value'] = $v[$field];

            $returnJSON[$id] = $child;
        }

        $this->putJSON($returnJSON);
    }
    
    // Листалка итемов сущьностей
    public function prevNextLoad(){
        
        $treeLink = $_POST['link'];
        
        $node = K_tree::getNode($treeLink);
        
        if(!$node){
            
              $jsonReturn['error'] = true;
              $jsonReturn['msg'] = 'Ошибка: неправильная ссылка на элемент';
            
              $this->putJSON($jsonReturn);
         }        
                
               
        $jsonReturn['error'] = false;
        
        $prevBro = K_tree::getPrevBro($node['tree_id']);
        $nextBro = K_tree::getNextBro($node['tree_id']);
        
        $jsonReturn['prev'] = !empty($prevBro['tree_link'])? $prevBro['tree_link'] : false;  
        $jsonReturn['next'] = !empty($nextBro['tree_link'])? $nextBro['tree_link'] : false;  
           
        $jsonReturn['html'] = K_Request::call(array(
        
                                        'module'     => 'default',
                                        'controller' => 'index',
                                        'action'     => 'page',
                                        'params'     =>  array('0' =>$treeLink),
                                        'disableLayout' => false,
                                        'layout' => 'contentlayout'
                                        
                              ));
       
        $this->putJSON($jsonReturn);
    }
    
    // Отдаёт родителей ноды, необходимо для расскрытия дерева при переходе на редактирование 
    public function getParents() {
        $nodeParents = array();
        $treeid=intval($_POST['treeid']);
        
        if ($treeid) {
            $nodeParents = K_Tree::getParents($treeid);
        }
        $this->putJSON($nodeParents);
    }
    
// загружает клиентскую форму по AJAX
    private function showClientForm() {
        if($_POST['form']) {
            $result = '';
            $this->view->type = $_GET;
            $this->view->loadFormTemplate(
                    array(
                        'formStart' => '<div class="mainForm"><div style="display: none;" class="nNote nSuccess hideit" id="flash-msg-nNote"><p></p></div>',
                        'formEnd' => '</div>',
                        'row' => '<div class="rowElem noborder user-form-row"><label>{{label}}:</label><div class="formRight">{{element}}</div><div class="fix"></div></div>',
                        'row_submit' => '{{element}}',
                        'row_reset' => '{{element}}',
                        'row_file' => '<div class="rowElem noborder user-form-row"><label>{{label}}:</label><div class="formRight" >{{element}}</div><div class="fix"></div></div>',
                        'row_select' => '<div class="rowElem noborder user-form-row"><label>{{label}}:</label><div class="formRight" >{{element}}</div><div class="fix"></div></div>',
                        'checkbox' => '<div class="rowElem noborder user-form-row"><label>{{label}}:</label><div class="formRight" >{{element}}</div><div class="fix"></div></div>',
                        'radio' => '<div class="rowElem noborder user-form-row"><label>{{label}}:</label><div class="formRight" >{{element}}</div><div class="fix"></div></div>',
                        'row_formbuilder' => '{{element}}'
                    )
            );
            ob_start();
            $this->view->generateClientForm('/client_forms/'.addcslashes($_POST['form'], "\000\n\r\\'\"\032").'/','/api/clientform/');
            $result = ob_get_contents();
            ob_end_clean();
        }
        $this->putAJAX($result);
    }
	
	
    // обработчик клиентских форм по AJAX
    private function clientForm() {
        if (! K_Request::isPost()) {
            //ошибка
            $this->putAjax("ERROR");
        }
        $typeClientForm = new Admin_Model_ClientForm;

        //загружаем данные формы
        $formData = Gcontroller::loadclientFormStructure(trim($_POST['tree_link']));
        $formStructure = json_decode($formData['form_structure']);
        $formStructure = K_Tree_Types::objectToArray($formStructure);

        foreach ($formStructure as $v) {
            
            if ($v['type'] == 'xform') {
                
                //сохраняем дополнительный настройки
                
                $Xform = $v['values'];
            } else {
                // сохраним ключи полей, что-бы сохранять в базу только то что надо.
                $formFields[] = $v['values']['name'];
                if (isset($v['values']['name']) && isset($v['vlds'])) {
                    $name = $v['values']['name'];
                    $nameAccos[$name] = $v['values']['label'];
                    $vlds = $v['vlds'];
                    $fieldVlds = array();
                    foreach ($vlds as $vld) {
                        if ($vld == "requred") {
                            $fieldVlds['requred'] = true;
                        } else {
                            $fieldVlds[] = $vld;
                        }
                    }
                    $validate[$name] = $fieldVlds;
                }
            }
        }

        // выбираем из поста только нужные поля
        foreach ($_POST as $k => $v) {
            if (in_array($k, $formFields)) {

                if (is_string($v)) {
                    $data[$k] = trim($v);
                }
                $data[$k] = $v;
            }
        }


        if ($typeClientForm->isValidRow($data, $validate)) {
            $clientFormData = new Admin_Model_ClientFormData;

            $saveDate = array('clientform_data_type' => trim($_POST['tree_link']), 'clientform_data_content' => serialize($data));

            // сахроняем форму и отправляем письма.
            if ($Xform['ck_save_db']) {
                $clientFormData->save($saveDate);
            }

            $render = new K_TemplateRender();
            $render->setTags($data);
            
            $mailer = new K_Mail;
            if (isset($Xform['ck_admin_email']) && $Xform['admin_mail_tmp'] && $Xform['admin_email']) {
                //Отправляем письмо на емеил админа
                $mailText = $render->assemble($Xform['admin_mail_tmp']);
                $mailer->setBody($mailText);
                $mailer->addTo($Xform['admin_email']);
                
                $mailer->send('test@ukr.net', 'Ползователь заполнил форму');
                
            }

            //  echo $data['ck_user_email'].'    '.$Xform['ck_user_email'].' '.$Xform['client_email_field_name'].'  '.$Xform['client_mail_tmp'];

             if (isset($data['ck_user_email']) && isset($Xform['ck_user_email']) && isset($Xform['client_email_field_name']) && isset($Xform['client_mail_tmp'])) {
                $clientMailFieldName = $Xform['client_email_field_name'];

                if (isset($data[$clientEmailFieldName])) {
                    //Отправляем письмо на емеил пользователя

                    $mailText = $render->assemble($Xform['client_mail_tmp']);
                    $mailer->setBody($mailText);
                    $mailer->addTo($data[$clientEmailFieldName]);
                    $mailer->send('test@ukr.net', 'Ваша форма удачно отправлена');
                }
            }
            
            $jsonReturn['error'] = false;
            $jsonReturn['msg'] = '<strong>ОК:<strong> Форма удачно отправлена';
            
        } else {
            
            $jsonReturn['error'] = true;
            $jsonReturn['msg'] = $typeClientForm->getErrorsD($nameAccos);
            
        }

        if (K_Request::isAjax()) {
            
            $this->putJSON($jsonReturn);
            
        } else {
            
            $this->putAjax("ERROR");
            
        }

        //
        /*else{
        if($jsonReturn['error'] = false){
        
        //заготовка на случай если js отключен
        //загрузка промежуточного шаблона с выводом ошибок и формой для продолжения заполнения 
         
        }  
        else{
        // промежуточный шаблон с нотификацией о правильном заполнении и редирект туда от куда пришол пользователь.    
        
        
        }
        
        }*/
    }

}
