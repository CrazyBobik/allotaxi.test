<?php defined('K_PATH') or die('DIRECT ACCESS IS NOT ALLOWED');

class Blocks_Controller_LastNews extends Controller {
	
	/* {public} */
	public $helpers = array();
	public $layout = 'layout';
    
	/* {actions} */
	public function indexAction() {

		$this->view->news = K_TreeQuery::crt('/news/')
			->type(array('news'))
			->limit(3, 0)
			->order(array('news'=>'date'))
			->go(array('childs'=>true, 'orderby'=>'DESC'));

        $this->render('lastnews');
	}

}