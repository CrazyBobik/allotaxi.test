<?php

ini_set ( 'max_execution_time', 1*60*60);
ini_set ( 'memory_limit ', '124M' );

defined('ROOT_PATH')
    || define('ROOT_PATH', realpath(dirname(__FILE__) . '/..'));
    
$gallerys = array(
    
    'stoechno-rigelnie-fasadi'=>'Стоечно-ригельные фасады',
    'raspashnie-dveri'=>'Распашные двери',
    'doors'=>'Двери',
    'dushevie-kabini'=>'Душевые кабины',
    'kozirki'=>'Козырьки',
    'ograzhdeniya-i-lestnitsi'=>'Ограждения и лестницы',
    'septa'=>'Перегородки',
    'pol-potolok'=>'Пол и потолок',
    'fasadyi-i-vitrinyi'=>'Фасады и витрины'


);

$gallerysUa = array(
   
    'stoechno-rigelnie-fasadi'=>'Стійко-ригельні фасади',
    'raspashnie-dveri'=>'Розсувні двері',
    'doors'=>'Двері',
    'dushevie-kabini'=>'Душові кабіни',
    'kozirki'=>'Cкляні дашки',
    'ograzhdeniya-i-lestnitsi'=>'Огорожі та сходи',
    'septa'=>'Перегородки',
    'pol-potolok'=>'Підлога і стеля',
    'fasadyi-i-vitrinyi'=>'Фасади та вітрини'


);

$cityes = array(
     'ivano-frankovsk','kiev','lvov','nikolaev','odessa','simferopol','herson','chernovtsyi'
);

$cityesRu = array(
    
    'ivano-frankovsk'=>'Ивано-Франковск',
    'kiev'=>'Киев',
    'lvov'=>'Львов',
    'nikolaev'=>'Николаев',
    'odessa'=>'Одесса',
    'simferopol'=>'Симферополь',
    'herson'=>'Херсон',
    'chernovtsyi'=>'Черновцы'
);

$cityesUa = array(
    
    'ivano-frankovsk'=>'Івано-Франківськ',
    'kiev'=>'Киiв',
    'lvov'=>'Львів',
    'nikolaev'=>'Миколаїв',
    'odessa'=>'Одеса',
    'simferopol'=>'Сімферополь',
    'herson'=>'Херсон',
    'chernovtsyi'=>'Чернівці'
    
);

$surl = "http://glassok.ua/gallery/";

$sectionM = new Type_Model_Section; 
$galleryM = new Type_Model_Gallery; 

foreach($gallerys as $k=>$v){
     
    K_CupTree::addNode($sectionM, 'section', '/gallery/', $v, $k, array('type_section_header'=>$v,
                                                                        'type_section_header_uk'=>$gallerysUa[$k]), $errSql = false);	
     
    foreach($cityes as $c){
        
          $html = K_Inet::grabFile($surl.$k.'/'.$c.'/'); 
          
          $firtsImage ='';
          
          $images = array();
          
          if( preg_match_all('/http:\/\/www.glassok.ua\/gallery\/wp-content\/uploads\/(.*?)"/is', $html, $math)){
          
              foreach($math[1] as $v){
                   if(strpos($v,'-150x150')===false){
                        if($firtsImage==''){
                           $firtsImage = $v;
                        }
                        
                        $p = pathinfo($v);
                        
                        $image['t'] = $p['filename'];  
                        $image['f'] = $v;
                        
                        $images[] = $image;
                   }
              }
          
          }
        
          $data = array(
           
            'type_gallery_header' =>$cityesRu[$c],  
            'type_gallery_header_uk'=>$cityesUa[$c],
            'type_gallery_image'=>$firtsImage,
            'type_gallery_images'=>serialize($images)
                               
          );
       
          K_CupTree::addNode($galleryM, 'gallery', '/gallery/'.$k.'/', $cityesRu[$c], $c, $data, $errSql = false);
        
    }
 
}


?>