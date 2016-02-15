<?php
error_reporting(E_ALL & ~E_NOTICE);
date_default_timezone_set('UTC'); 

header("Content-Type: text/xml"); 

    $siteurl = K_Registry::get('site');
    $sitemap = new Sitemap;
    
    //настройки источников и для формирования ссылок
      $TypesPlases = array(
          'articles' => array('/articles/' => array(
                                                   "source"=>'/articles/',
                                                   "opt" =>array('direct'=>true)  
                                                   )
                             )
                            
      );    
    
     // Добавляем главную страницу
     $sitemap->addUrl($siteurl,$update,'daily','0.9');
     
     $noInSitemap = array('baseblocks','404','index','search','articlepage','object','print','articles');   
      
      //кастомные страницы  // учитывать страницы с листалкой
     $staticPages = K_TreeQuery::crt("/pages/")
                                 ->types('page')
                                 ->go(); 
       
     $pagesForCount = array_keys($pagesCounts);
     
     foreach($staticPages as $v){
        
           if (!in_array($v['tree_name'],$noInSitemap)){
           
            /*
                    if (in_array($v['tree_name'],$pagesForCount)){
                        if($pagesCounts[$v['tree_name']] && count($pagesCounts[$v['tree_name']])){
                            // статические страницы с листалкой - начальная страница
                                      echo "<url>\n<loc>".$siteurl.'/'.$v['tree_name']."</loc> 
                                                 <lastmod>$update</lastmod> 
                                                 <changefreq>daily</changefreq> 
                                                  <priority>0.5</priority>
                                             </url>\n"; 
                                             
                             $pCount = ceil($pagesCounts[$v['tree_name']]/10);
                                  for($i=2;$i<$pCount;$i++){ 
                             // статические страницы с листалкой - сама листалка
                                        echo "<url>\n<loc>".$siteurl.'/'.$v['tree_name'].'.list.'.$i.".10</loc> 
                                                  <lastmod>$update</lastmod> 
                                                  <changefreq>daily</changefreq> 
                                                  <priority>0.5</priority> 
                                               </url>\n"; 
                                     }
                         }
                     }else{
                        */
                        
                        // статические страницы без листалки
                        $sitemap->addUrl($siteurl.'/'.$v['tree_name'],$update,'daily','0.5');
                    // }
           }
           
           //добавить страницу в игнор лист, что-бы небыло повторов.
         $noInSitemap[]=$v['tree_name'];  
       }   
      
    $articles = K_TreeQuery::crt("/articles/")
                                 ->type("/articles/")
                                 ->go();
                                 
    foreach($articles as $v){
           $sitemap->addUrl($siteurl.'/'.$v['tree_name'].".html",$update,'daily','0.5');
    }        
    
    $q = new K_query();
   
    $objects = $q->q( "SELECT url FROM obj_objects WHERE  url !=''",true);                       
                                       
    foreach($objects as $v){
           $sitemap->addUrl($siteurl.'/'.$v['url'],$update,'daily','0.5');
    }        
        
    echo  $sitemap->genSitemap();
  
    $this->disableLayout = true;
    exit();    
?>