<?php 

function phs( $text, $nl2br = false ) {
    return $nl2br ? nl2br( htmlspecialchars( $text ) ) : htmlspecialchars( $text );
}

function ephs( $text, $nl2br = false ) {
    echo $nl2br ? nl2br( htmlspecialchars( $text ) ) : htmlspecialchars( $text );
}
	
function h( $text ) {
    return htmlspecialchars( $text );
}

function eh( $text ) {
    echo htmlspecialchars( $text );
}

function t($rus, $ukr){
    
     K_Registry::get('lang');
    
    if(K_Registry::get('lang')=='uk'){
        
       return  $ukr;
       
    }else{
    
       return $rus;
       
    }
}


function r(&$data, $field ){
     
    if(K_Registry::get('lang')=='uk'){
        
       return  $data[$field.'_uk'];
       
    }else{
    
       return  $data[$field];
    }
}

function l(){
    
    if(K_Registry::get('lang')=='uk'){
        
       return '/uk';
       
    }else{
    
       return '';
       
    }
}

?>