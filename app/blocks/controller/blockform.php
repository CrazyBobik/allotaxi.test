<?php defined('K_PATH') or die('DIRECT ACCESS IS NOT ALLOWED');

class Blocks_Controller_Blockform extends Controller {
	
	/* {public} */
	public $helpers = array();
	public $layout = 'layout';
    
	/* {actions} */
	public function indexAction() {
	   
        $this->view->node = $this->getParam('node');
        
        $this->view->type = $_GET;
        
        $this->view->loadFormTemplate(
        
               array(
               
                    'formStart' => '<div class="mainForm"><div style="display: none;" class="nNote nSuccess hideit" id="flash-msg-nNote"><p></p></div>',
                  
                    'formEnd' => '</div>',
                 
                    'row' => '<div class="rowElem noborder user-form-row {{class}}"><label class="mainlabel">{{label}}</label><div class="formRight">{{element}}</div><div class="fix"></div></div>',
                 
                    'row_submit' => '{{element}}',
                 
                    'row_reset' => '{{element}}',
                 
                    'row_file' => '<div class="rowElem noborder user-form-row"><label>{{label}}</label><div class="formRight" ><div class = "option-elemnts">{{element}}</div></div><div class="fix"></div></div>',
                   
                    'row_select' => '<div class="rowElem noborder user-form-row"><label>{{label}}</label><div class="formRight" ><div class = "option-elemnts"> {{element}}</div></div><div class="fix"></div></div>',
                  
                    'row_checkbox' => '<div class="rowElem noborder user-form-row {{class}}"><label class="mainlabel">{{label}}</label><div class="formRight"><div class="option-elemnts">{{element}}</div></div><div class="fix"></div></div>',
            
                    'row_radio' => '<div class="rowElem noborder user-form-row {{class}}"><label class="mainlabel">{{label}}</label><div class="formRight"><div class="option-elemnts">{{element}}</div></div><div class="fix"></div></div>',
                
                    'checkbox' => '<div class="rowElem noborder user-form-row"><label>{{label}}</label><div class="formRight" ><div class = "option-elemnts">{{element}}</div></div><div class="fix"></div></div>',
                  
                    'radio' => '<div class="rowElem noborder sdasas user-form-row"><label>{{label}}</label><div class="formRight" ><div class = "option-elemnts">{{element}}</div></div><div class="fix"></div></div>',
                  
                    'row_formbuilder' => '{{element}}'
                )
        );
	}

}