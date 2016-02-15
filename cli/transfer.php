<?php

ini_set ( 'max_execution_time', 1*60*60);
ini_set ( 'memory_limit ', '124M' );

defined('ROOT_PATH')
    || define('ROOT_PATH', realpath(dirname(__FILE__) . '/..'));
    
//include('classes/db.php');

/*

include(ROOT_PATH.'/configs/all_config.php');

include K_PATH.'/loader.php';

spl_autoload_register(array('K_Loader', 'auto_load'));
*/
/*
K_Query::connSettings(array(
                                     'host'=>AllConfig::$mysqBDConf['host'],
								     'login'=>AllConfig::$mysqBDConf['user'],
								     'password'=>AllConfig::$mysqBDConf['password'],
							    	 'dbname'=>AllConfig::$mysqBDConf['database'],
								     'port' => 3306
               		  ));
                      */
	/*				  
    $clients = K_Query::query('SELECT * FROM `wp_posts` WHERE post_type="post" AND post_status="publish"');			  
   
    $typeM = new Type_Model_News; 
    
    foreach($clients as $v){ 
          
            $content = explode('<!--:-->', $v['post_content']);
            $title = explode('<!--:-->', $v['post_title']);
            
            $data = array(
            
                'type_news_head' => str_replace('<!--:ru-->','', $title[0]),  
                'type_news_head_uk'=> str_replace('<!--:uk-->','', $title[1]),
                
                'type_news_content'=> str_replace('<!--:ru-->','', $content[0]),
                'type_news_content_uk'=> str_replace('<!--:uk-->','', $content[1]),
                'type_news_date' => $v['post_date']
       
                  );
       
            K_CupTree::addNode($typeM, 'news', '/novosti/', str_replace('<!--:ru-->','', $title[0]), $v['post_name'], $data, $errSql = false);	
 
	}	*/
    
   	/*		  
    $clients = K_Query::query('SELECT * FROM `wp_posts` WHERE `post_type` LIKE "%page%" and post_parent="0"');			  
   
    $typeM = new Type_Model_Articles; 
    
    foreach($clients as $v){ 
          
            $content = explode('<!--:-->', $v['post_content']);
            $title = explode('<!--:-->', $v['post_title']);
            
            $data = array(
                
                    'type_articles_content' => str_replace('<!--:ru-->','',$content[0] ),  
                    'type_articles_content_uk'=> str_replace('<!--:uk-->','', $content[1]),
                    
                    'type_articles_header'=> str_replace('<!--:ru-->','',$title[0] ),
                    'type_articles_header_uk'=> str_replace('<!--:uk-->','', $title[1]),
         
                  );
       
            K_CupTree::addNode($typeM, 'articles', '/articles/', str_replace('<!--:ru-->','', $title[0]), $v['post_name'], $data, $errSql = false);	
 	}
    
    
   */
   
   // перенос сео 
   
    $clients = K_Query::query('SELECT * FROM tree t LEFT JOIN wp_posts p ON  t.tree_name=p.post_name LEFT JOIN wp_postmeta pm ON pm.post_id=p.ID WHERE pm.meta_key="title"
  ');			  
    
    foreach($clients as $v){ 
          
            $tok = explode('<!--:-->', $v['meta_value']);
            K_Query::query('UPDATE tree SET tree_meta_title="'.str_replace('<!--:ru-->','',$tok[0] ).'", tree_meta_title_uk="'.str_replace('<!--:uk-->','',$tok[1]).'" WHERE tree_id="'.$v['tree_id'].'"');			
        
   	}
        
    $clients = K_Query::query('SELECT * FROM tree t LEFT JOIN wp_posts p ON  t.tree_name=p.post_name LEFT JOIN wp_postmeta pm ON pm.post_id=p.ID WHERE pm.meta_key="description"
  ');			  
     
    foreach($clients as $v){ 
          
            $tok = explode('<!--:-->', $v['meta_value']);
            K_Query::query('UPDATE tree SET tree_meta_description="'.str_replace('<!--:ru-->','',$tok[0] ).'", tree_meta_description_uk="'.str_replace('<!--:uk-->','',$tok[1]).'" WHERE tree_id="'.$v['tree_id'].'"');				
            
   	}

    $clients = K_Query::query('SELECT * FROM tree t LEFT JOIN wp_posts p ON  t.tree_name=p.post_name LEFT JOIN wp_postmeta pm ON pm.post_id=p.ID WHERE pm.meta_key="keywords"
  ');			  
     
    foreach($clients as $v){ 
          
            $tok = explode('<!--:-->', $v['meta_value']);
            K_Query::query('UPDATE tree SET tree_meta_keywords="'.str_replace('<!--:ru-->','',$tok[0] ).'", tree_meta_keywords_uk="'.str_replace('<!--:uk-->','',$tok[1]).'" WHERE tree_id="'.$v['tree_id'].'"');		
            
   	}
     
    /*
    
    		  
    $clients = K_Query::query('SELECT * FROM `wp_posts` WHERE guid LIKE "http://www.glassok.ua/nashi-klienty/%"');			  
   
    $typeM = new Type_Model_Clients; 
    
    foreach($clients as $v){ 
          
            $content = explode('<!--:-->', $v['post_content']);
            $title = explode('<!--:-->', $v['post_title']);
            
            $data = array(
                
                    'type_clients_header' => str_replace('<!--:ru-->','', $title[0]),  
                    'type_clients_header_uk'=> str_replace('<!--:uk-->','', $title[1]),
                    
                    'type_clients_content'=> str_replace('<!--:ru-->','', $content[0]),
                    'type_clients_content_uk'=> str_replace('<!--:uk-->','', $content[1]),
                           
                  );
       
            K_CupTree::addNode($typeM, 'clients', '/clients/', str_replace('<!--:ru-->','', $title[0]), $v['post_name'], $data, $errSql = false);	
 
	};  
    */
    /*
              
                  $typesFields = array(
                
                       'clients' => array(
                            
                                'type_clients_header' => str_replace('<!--:ru-->','', $title[0]),  
                                'type_clients_header_uk'=> str_replace('<!--:uk-->','', $title[1]),
                                
                                'type_clients_content'=> str_replace('<!--:ru-->','', $content[0]),
                                'type_clients_content_uk'=> str_replace('<!--:uk-->','', $content[1]),
                                       
                              ),
                
                       'articles' => array(
                            
                                'type_articles_content' => str_replace('<!--:ru-->','',$content[0] ),  
                                'type_articles_content_uk'=> str_replace('<!--:uk-->','', $content[1]),
                                
                                'type_articles_header'=> str_replace('<!--:ru-->','',$title[0] ),
                                'type_articles_header_uk'=> str_replace('<!--:uk-->','', $title[1]),
                     
                              ),
                              
                        'news' => array(
                        
                            'type_news_head' => str_replace('<!--:ru-->','', $title[0]),  
                            'type_news_head_uk'=> str_replace('<!--:uk-->','', $title[1]),
                            
                            'type_news_content'=> str_replace('<!--:ru-->','', $content[0]),
                            'type_news_content_uk'=> str_replace('<!--:uk-->','', $content[1]),
                   
                              ),
                          
                        'produkciya' => array(
                        
                            'type_produkciya_header' => str_replace('<!--:ru-->','', $title[0]),  
                            'type_produkciya_header_uk'=> str_replace('<!--:uk-->','', $title[1]),
                            
                            'type_produkciya_content'=> str_replace('<!--:ru-->','', $content[0]),
                            'type_produkciya_content_uk'=> str_replace('<!--:uk-->','', $content[1]),
                     
                          )    
                
                );
    
    
    $posts = K_Query::query('SELECT * from tree t INNER JOIN wp_posts wp ON t.tree_name = wp.post_name');			  
    
    foreach($posts as $v){
        
            if(in_array($v['tree_type'], array_keys($typesFields))){
                     
                  $content = explode('<!--:-->', $v['post_content']);
                  $title = explode('<!--:-->', $v['post_title']);
                    
                    
                  $typesFields = array(
                
                       'clients' => array(
                            
                                'type_clients_header' => str_replace('<!--:ru-->','', $title[0]),  
                                'type_clients_header_uk'=> str_replace('<!--:uk-->','', $title[1]),
                                
                                'type_clients_content'=> str_replace('<!--:ru-->','', $content[0]),
                                'type_clients_content_uk'=> str_replace('<!--:uk-->','', $content[1]),
                                       
                              ),
                
                       'articles' => array(
                            
                                'type_articles_content' => str_replace('<!--:ru-->','',$content[0] ),  
                                'type_articles_content_uk'=> str_replace('<!--:uk-->','', $content[1]),
                                
                                'type_articles_header'=> str_replace('<!--:ru-->','',$title[0] ),
                                'type_articles_header_uk'=> str_replace('<!--:uk-->','', $title[1]),
                     
                              ),
                              
                        'news' => array(
                        
                            'type_news_head' => str_replace('<!--:ru-->','', $title[0]),  
                            'type_news_head_uk'=> str_replace('<!--:uk-->','', $title[1]),
                            
                            'type_news_content'=> str_replace('<!--:ru-->','', $content[0]),
                            'type_news_content_uk'=> str_replace('<!--:uk-->','', $content[1]),
                   
                              ),
                          
                        'produkciya' => array(
                        
                            'type_produkciya_header' => str_replace('<!--:ru-->','', $title[0]),  
                            'type_produkciya_header_uk'=> str_replace('<!--:uk-->','', $title[1]),
                            
                            'type_produkciya_content'=> str_replace('<!--:ru-->','', $content[0]),
                            'type_produkciya_content_uk'=> str_replace('<!--:uk-->','', $content[1]),
                     
                          )    
                
                );
                
              //  var_dump('Type_Model_'.$v['tree_type']);               
                               
                $typeModelName = 'Type_Model_'.$v['tree_type'];
                
                $typeM = new $typeModelName; 
                
                echo $v['tree_name'].'<br/>';
                
                $typeM->update($typesFields[$v['tree_type']], array('type_'.$v['tree_type'].'_id'=>$v['tree_id'])); 
               
           };
   }  
    */
    
    
?>