<?php


// Define path to aplication folders

defined('WWW_PATH')
|| define('WWW_PATH', realpath(ROOT_PATH.'/www'));

defined('APP_PATH')
|| define('APP_PATH', ROOT_PATH.'/app');

defined('PLATFORM_PATH')
|| define('PLATFORM_PATH', ROOT_PATH.'/framework');

defined('CONFIGS_PATH')
|| define('CONFIGS_PATH', ROOT_PATH.'/configs');

defined('K_PATH')
|| define('K_PATH', ROOT_PATH.'/framework/k');

defined('UPLOAD_PATH')
|| define('UPLOAD_PATH', ROOT_PATH.'/allotaxi.od.ua/upload');

class AllConfig
{

    static public $mysqBDConf = array (
        'host' => '127.0.0.1',
        'user' => 'allotaxi_sql',
        'password' => 'vxB32TFT7m',
        'database' => 'allotaxi_sql'
    );

    static public $domen = 'http://test.allotaxi.od.ua';
}


?>