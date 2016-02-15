<?php defined('K_PATH') or die('DIRECT ACCESS IS NOT ALLOWED');

class Blocks_Controller_Comments extends Controller {

	public $helpers = array('edit','paginator');

	public function indexAction() {
	     
        $commentModel = new Admin_Model_Comment;
         
        $this->view->comments = $commentModel->fetchAll(K_Db_Select::create()
                                                                        ->where(array( 'comment_status' => 'опубликован'
                                                                                      ))
                                                                        ->order('comment_date DESC')
                                                                        );   
           
         $capchaText = K_Secur::genCapchaText();
         
         
         $this->view->capacha64 = K_Secur::genCapcha($capchaText);
         K_Auth::setUserKey('capchaText',$capchaText);
         K_Auth::setUserKey('capchaTime',time()); 
           
   }
}