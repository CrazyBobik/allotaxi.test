<?php defined('K_PATH') or die('DIRECT ACCESS IS NOT ALLOWED');

class Blocks_Controller_Beaforafter extends Controller {

	public $helpers = array('edit','paginator');

	public function indexAction() {
	   
        $this->view->node = $this->getParam('node');
          
   
   }
}