<?php defined('K_PATH') or die('DIRECT ACCESS IS NOT ALLOWED');

class Blocks_Controller_Price extends Controller {
	
	/* {public} */
	public $helpers = array();
	public $layout = 'layout';
    
	/* {actions} */
	public function indexAction() {


        $this->render('price');
	}

}