<?php

class K_SiteMapBig {
    private static $mainFileXML;
    private static $countFile = 0;
    private static $content = '';
    private static $fullCount = 0;
    private static $maxFileSize = 51380224;
    private static $maxCountURL = 50000;
    private static $countURL = 0;
    private static $sitemapHead = '<?xml version="1.0" encoding="utf-8" ?>';
    private static $sitemapUrlset = '    <urlset xmlns="http://www.google.com/schemas/sitemap/0.84" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  xsi:schemaLocation="http://www.google.com/schemas/sitemap/0.84 http://www.google.com/schemas/sitemap/0.84/sitemap.xsd">';
    private static $sitemapUrlsetClose = '    </urlset>';

    public static function init(){
        self::$mainFileXML = '<?xml version="1.0" encoding="UTF-8"?>
    <sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
        if (file_exists(WWW_PATH.'/sitemap/')) {
            foreach (glob(WWW_PATH.'/sitemap/*') as $file)
                unlink($file);
        }
        self::$countFile = 0;
        self::$content = '';
        self::$fullCount = 0;
        self::$countURL = 0;
    }

    public static function addFile($name){
        self::$mainFileXML .= '
        <sitemap>
            <loc>'.AllConfig::$site.'/sitemap/'.$name.'</loc>
            <lastmod>'.date('c').'</lastmod>
        </sitemap>';
        self::$countFile++;
        self::$countURL = 0;
        self::$fullCount = 0;
        self::$content = '';
    }

    public static function saveIndex(){
        self::$mainFileXML .= "\r\n    </sitemapindex>";
        file_put_contents(WWW_PATH.'/sitemap/index.xml', self::$mainFileXML);
    }

    public static function addURL($url, $lastmod, $priority ="0.5", $last = false, $changefreq = "daily"){
        if(!$lastmod){
            $lastmod = date("Y-m-d");
        }

        $temp = "        <url>
            <loc>".AllConfig::$site.$url."</loc>
            <lastmod>".$lastmod."</lastmod>
            <changefreq>$changefreq</changefreq>
            <priority>$priority</priority>
        </url>\r\n";
        self::$fullCount += strlen($temp);
        self::$countURL++;

        self::$content .= $temp;

        if (self::$fullCount > self::$maxFileSize
            || self::$countURL >= self::$maxCountURL
            || $last){
            $temp = self::$sitemapHead."\r\n".self::$sitemapUrlset."\r\n".self::$content."\r\n".self::$sitemapUrlsetClose;

            $fileGZ = gzopen(WWW_PATH.'/sitemap/file-sitemap'.self::$countFile.'.xml.gz', 'w9');
            gzwrite($fileGZ, $temp);
            self::addFile('file-sitemap'.self::$countFile.'.xml.gz');
        }

    }
}

?>