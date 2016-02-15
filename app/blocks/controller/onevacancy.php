<?php defined('K_PATH') or die('DIRECT ACCESS IS NOT ALLOWED');

class Blocks_Controller_OneVacancy extends Controller {

    public $helpers = array('editor');
    
	public function indexAction() {

		$this->view->one = K_Registry::get('one');
		K_Registry::write('h1', $this->view->one['name']);

        K_Crumbs::add(array('Вакансии', 'taxi-work'));
		K_Crumbs::add(array($this->view->one['name'], $this->view->one['tree_name']));

		$this->render('onevacancy');
	}
}

