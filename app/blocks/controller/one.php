<?php defined('K_PATH') or die('DIRECT ACCESS IS NOT ALLOWED');

class Blocks_Controller_One extends Controller {

    public $helpers = array('editor');
    
	public function indexAction() {

		$this->view->one = K_Registry::get('one');
		K_Registry::write('h1', $this->view->one['header']);

//        var_dump($one);
        K_Crumbs::add(array('Новости', 'taxi-novosti'));
		K_Crumbs::add(array($this->view->one['tree_title'], $this->view->one['tree_name']));

		$next = K_Tree::getNextBro('', $this->view->one);
        $prev = K_Tree::getPrevBro('', $this->view->one);
        
        $this->view->next = $next['tree_name'];
        $this->view->prev = $prev['tree_name'];

		$this->render('one');
	}
}

