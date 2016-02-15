<?php defined('K_PATH') or die('DIRECT ACCESS IS NOT ALLOWED');

class Forms_Controller_Index extends Controller {
	
	/* {public} */
	public $helpers = array('paginator', 'call', 'error', 'form', 'include', 'ru');
	public $layout = 'layout';
	
	/* {private} */
	private $test = 'test';
    
	/* {actions} */
	public function indexAction() {
	
        $this->render('index');
	}
	
	/* {methods} */

}