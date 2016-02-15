<?php

/**

 * Breadcrumbs

 */

class K_Breadcrumbs

{
	/**

	 * breadcrumbs

	 * 

	 * (default value: array())

	 * 

	 * @var array

	 * @access private

	 * @static

	 */

	private static $breadcrumbs = array();
	

	/**

	 * clear function.

	 * 

	 * @access public

	 * @static

	 * @return void

	 */

	public static function clear()

	{

		self::$breadcrumbs = array();

	}

	

	/**

	 * get function.

	 * 

	 * @access public

	 * @static

	 * @return array Breadcrumbs

	 */

	public static function get()

	{

		return self::$breadcrumbs;

	}

	/**

	 * add function.

	 * 

	 * @access public

	 * @static

	 * @param array array({title}, {url})

	 * @return boolean TRUE | exception Breadcrumb_Exception

	 */

	public static function add(array $array)
	{

        if(is_array($array) && count($array) == 2){

    		array_push(self::$breadcrumbs,array('title'=>$array[0],
                                                'url'=>$array[1]
                                                ));

    		return TRUE;

        } else {

            throw new Exception("Input to Breadcrumbs:add must be an array of 2 elements (array(title, url))!");
    
        }
	}
    
    
    public static function fromNodes($nodes, $sliceLink, $exclude=array())
	{
	   // $link = trim($link,'/');
      
       // $linkFragments = explode('/', $link);
        
       //  var_dump($nodes);
        
        foreach($nodes as $v){
            
            if(!in_array($v['tree_link'],$exclude) ){
                
                   self::add(array( $v['tree_title'], str_replace($sliceLink,'',$v['tree_link'])));
                   
            }
            
        }
      
      
        return $result;
	}
    
    
    
    public static function fromNodeLink($link)
	{
	   
        $link = trim($link,'/');
      
        $linkFragments = explode('/', $link);
        
        
        
        
        
        foreach($linkFragments as $v){
            
                    
            self::add(array(
            'title'=>
            'url'
            ));
            
        }
      
      
        return $result;
	}
    
    
    
    
    
   	/**

	 * add function.

	 * 

	 * @access public

	 * @static

	 * @param array array({title}, {url})

	 * @return boolean TRUE | exception Breadcrumb_Exception

	 */

	public static function Render()
	{
      
        $breadcrumbs = self::$breadcrumbs;
       
        ob_start();

        include (APP_PATH . '/blocks/_base_/breadcrumbs.phtml');

        $result = ob_get_contents();
        
        ob_end_clean();
        
        return $result;
	}
}

