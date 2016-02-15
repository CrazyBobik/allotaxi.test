<?php defined('K_PATH') or die('DIRECT ACCESS IS NOT ALLOWED');

class Blocks_Controller_News extends Controller{

	public $helpers = array('editor');

	public function indexAction(){
		K_Crumbs::add(array('Новости', 'taxi-novosti'));

		// how many records per page
		$size = 10;

		$this->view->page = 1;

		// we get the current page from $_GET
		if (isset($_GET['page'])){
			$this->view->page = (int)$_GET['page'];
		}

		$pag_info = K_Paginator::prepear($this->view->page, $size);

		list($this->view->news, $this->view->countItems) = K_TreeQuery::crt('/news/')
			->type(array('news'))
			->limit($pag_info['onPage'], $pag_info['start'])
			->order(array('news' => 'date'))
			->go(array('childs' => true, 'count' => true, 'orderby' => 'DESC'));
		$this->view->pages = ceil($this->view->countItems / $pag_info['onPage']);

		$this->render('news');
	}
}

