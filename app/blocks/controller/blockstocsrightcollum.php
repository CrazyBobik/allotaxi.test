<?php defined('K_PATH') or die('DIRECT ACCESS IS NOT ALLOWED');

class Blocks_Controller_Blockstocsrightcollum extends Controller {
	
    public $helpers = array();
    
  	public function indexAction() {
       
           $this->view->promo = K_TreeQuery::crt('/promo/')->type('promo')->limit(3)->go(array('childs'=>true));
       
   	}
    
}