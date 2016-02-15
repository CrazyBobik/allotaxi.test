<?php
set_time_limit(50000);
//php /home/premier/web/premier-realty.com.ua/public_html/cli/cron/sitemap.php

ini_set ('memory_limit', '512M');

include realpath(dirname(__FILE__) . '/../../configs/loader.php');

date_default_timezone_set('UTC');

$filename = WWW_PATH.'/sitemap.xml';

$sitemap = new K_Sitemap;

//Главная
$sitemap->addUrl('', 1);

//Страницы статические
$noInSitemap = array('404','baseblocks','index','one','sitemap');
$priority = array(
    'taxi-about-us' => 0.9,
    'taxi-price' => 0.9,
    'taxi-contact-us' => 0.9,
    'taxi-work' => 0.9,
    'taxi-novosti' => 0.9,
    'skorost-i-bezopasnost' =>0.8,
    'peregon-avto' =>0.8,
    'luchshie-tsenyi' =>0.8,
    'perevozka-gruzov' =>0.8,
);

$pages = K_TreeQuery::crt('/pages/')->types(array('page'))->go();

foreach ($pages as $v){
    if (!in_array($v['tree_name'], $noInSitemap)){
        $p = $priority[$v['tree_name']];
        $sitemap->addUrl('/'.$v['tree_name'], isset($p) ? $p : 0.5);
    }
}
//Страницы новостей
$pages = K_TreeQuery::crt('/news/')->types(array('news'))->go();

foreach ($pages as $v){
    if (!in_array($v['tree_name'], $noInSitemap)) {
        $sitemap->addUrl('/' . $v['tree_name'], 0.7);
    }
}

//Страницы статтей
$pages = K_TreeQuery::crt('/articles/')->types(array('articles'))->go();

foreach ($pages as $v){
    if (!in_array($v['tree_name'], $noInSitemap)) {
        $p = $priority[$v['tree_name']];
        $sitemap->addUrl('/' . $v['tree_name'], isset($p) ? $p : 0.5);
    }
}

file_put_contents($filename, $sitemap->genSitemap());
?>