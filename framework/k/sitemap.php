<?php
class K_Sitemap{
   
   public $sitemapUrls = array() ;
   private $sitemapHead = '<?xml version="1.0" encoding="utf-8" ?>';
   private $sitemapUrlset = '<urlset xmlns="http://www.google.com/schemas/sitemap/0.84" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  xsi:schemaLocation="http://www.google.com/schemas/sitemap/0.84 http://www.google.com/schemas/sitemap/0.84/sitemap.xsd">';
   private $sitemapUrlsetClose = '</urlset>';

   private function lastmodPage($lastmod){
      
      if(!$lastmod){
          return date("Y-m-d");
      }
      
          return $lastmod;
   }
     
   public function addUrl($url, $priority ="0.5", $lastmod = false, $changefreq = "daily"){
      
       $update = date("Y-m-d"); 
       $this->sitemapUrls[]= "<url> 
                                <loc>".AllConfig::$domen.$url."</loc>
                                <lastmod>".$this->lastmodPage($lastmod)."</lastmod> 
                                <changefreq>$changefreq</changefreq> 
                                <priority>$priority</priority> 
                             </url>"; 
             
   }
   
   
   public function genSitemap(){
       
       return $this->sitemapHead."\n".
                $this->sitemapUrlset."\n".
                implode("\n", $this->sitemapUrls)."\n".
                $this->sitemapUrlsetClose; 
       
   }
   
}