<?php defined('K_PATH') or die('DIRECT ACCESS IS NOT ALLOWED');

class Blocks_Controller_AllVacancies extends Controller{

	public $helpers = array('editor');

	public function indexAction(){
		K_Crumbs::add(array('Вакансии', 'taxi-work'));

		// how many records per page
		$size = 10;

		$this->view->page = 1;

		// we get the current page from $_GET
		if (isset($_GET['page'])){
			$this->view->page = (int)$_GET['page'];
		}

		$pag_info = K_Paginator::prepear($this->view->page, $size);

		list($this->view->vacancies, $this->view->countItems) = K_TreeQuery::crt('/vacancies/')
			->type(array('vacancy'))
			->limit($pag_info['onPage'], $pag_info['start'])
			->go(array('childs' => true, 'count' => true, 'orderby' => 'DESC'));
		$this->view->pages = ceil($this->view->countItems / $pag_info['onPage']);

		$this->render('allvacancies');
	}
}

