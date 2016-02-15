<?php defined('K_PATH') or die('DIRECT ACCESS IS NOT ALLOWED');

class Blocks_Controller_LastVacancies extends Controller {
	
	/* {public} */
	public $helpers = array();
	public $layout = 'layout';
    
	/* {actions} */
	public function indexAction() {

		$this->view->vacancies = K_TreeQuery::crt('/vacancies/')
			->type(array('vacancy'))
			->limit(2, 0)
			->go(array('childs'=>true, 'orderby'=>'DESC'));

        $this->render('lastvacancies');
	}

}