<?php 
     define('_SAPE_USER', '2324a5d4a47a01cd6bef52faa147fa9c');
     require_once($_SERVER['DOCUMENT_ROOT'].'/'._SAPE_USER.'/sape.php'); 
     $sape_articles = new SAPE_articles();
     echo $sape_articles->process_request();
?>
