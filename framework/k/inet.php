<?php

/**
 * @package    DM
 * @category   Helpers
 */
class K_Inet{
    
    
  public static function grabFile($loc) {
        $ch = curl_init($loc);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_BINARYTRANSFER, 1);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ch, CURLOPT_FAILONERROR, 1);
        $data = curl_exec($ch);

        if (! $data || curl_errno($ch) != 0 || curl_getinfo($ch, CURLINFO_HTTP_CODE) > 403) {
            curl_close($ch);
            return false;
        }
        curl_close($ch);
        return $data;
    }
    
    
    public function grabFileRep($url, $countRepeat = 5, $sleep = 5, $say = false){
         $repeat = 0;
     
          do{ 
              $repeat++;
      
            if($repeat > $countRepeat){
                break;
            }
             sleep($sleep);
          } while (0);
           
          if($repeat>=$countRepeat){
            if($say){
               echo "Не удалось загрузить файл по ссылке ".$url." после  ".$repeat." попыток";
              
            }
            return false;
          }   
  
         return $data;  
   }
    
   public static function saveFileRep($url, $path, $countRepeat = 5, $sleep = 5, $say = false){
    
        $repeat = 0;
    
        do{
          $repeat++;
           
          if(($repeat > $countRepeat || DM_Inet::saveFile($url ,$path)))  {
            break;
          }
          
          sleep($sleep);
          
        } while (0);
       
       if($repeat>=$countRepeat){
          if($say){
               echo "Не удалось загрузить файл по ссылке ".$url." после  ".$repeat." попыток";
               DM_cli::nbr();
           }
           
           return false;
       }   
        
       return true; 
   }

    

    public static function saveFile($loc, $dsc, $zip = false) {
        if (function_exists(curl_init)) {

            if (file_exists($dsc)) {
                unlink($dsc);
            }
            $f1 = @fopen($dsc, "w");

            $ch = curl_init($loc);
            curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_BINARYTRANSFER, 1);
            curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
            curl_setopt($ch, CURLOPT_FILE, $f1);

            if ($zip) {
                curl_setopt($ch, CURLOPT_ENCODING, 'gzip , deflate');
            }

            if (curl_errno($ch) != 0 || curl_getinfo($ch, CURLINFO_HTTP_CODE) > 403) {
                curl_close($ch);
                fclose($f1);
                return false;
            }

            curl_exec($ch);
            curl_close($ch);
            fflush($f1);
            fclose($f1);
            return true;
        }
    }
    
    public static function parseCurrency() {
    
        $cacheManager = K_Registry::get('cacheManager');
        $cacheEver =  K_Cache_Manager::get('unlim');
        $cache24h =  K_Cache_Manager::get('24h');

        $currencyList = array();
        if (!$cache24h->test('CURS')){
            $content = file_get_contents('http://finance.ua/ru/');
            $matches = array();
            preg_match('#<div\s*id="portlet-currency-cash-cashless".*?>.*?<div\s*class="portlet-content">(?P<table>.*?)</div>#is', $content, $matches);
            if (! empty($matches['table'])) {
                $table = $matches['table'];
                $matches = array();
                preg_match_all('#<tr\s*class="(odd|even)">(?P<list>.*?)</tr>#is', $table, $matches);
                if (count($matches['list'])) {
                    foreach ($matches['list'] as $line) {
                        $matches = array();
                        $pattern = '<td\s*class="iname">';
                        $pattern .= '.*?<a.*?>(?P<currency_digit>\d+|)(?P<currency_name>.*?)</a>';// чуток поправил паттерн
                        $pattern .= '.*?<td.*?>.*?(?P<cur1>[0-9.]+)';
                        $pattern .= '.*?<td.*?>.*?(?P<cur2>[0-9.]+)';
                        $pattern .= '.*?<td.*?>.*?(?P<cur3>[0-9.]+)';
                        $pattern .= '.*?<td.*?>.*?(?P<cur4>[0-9.]+)';
                        preg_match('#' . $pattern . '#is', $line, $matches);
                        if (count($matches)) {
                            $currencyList[$matches['currency_name']] = array(
                                'digit' => $matches['currency_digit'],
                                'cash_bid' => number_format($matches['cur1'], 2, '.', ' '),
                                'cash_ask' => number_format($matches['cur2'], 2, '.', ' '),
                                'noncash_bid' => number_format($matches['cur3'], 2, '.', ' '),
                                'noncash_ask' => number_format($matches['cur4'], 2, '.', ' '));
                        }
                    }
                }
            }
            
            preg_match('#<div\s*id="portlet-currency-official".*?>.*?<div\s*class="portlet-content">(?P<table>.*?)</div>#is', $content, $matches);
              
            if (! empty($matches['table'])) {
                 
                $table = $matches['table'];
                $matches = array();
                preg_match_all('#<tr\s*class="(odd|even)">(?P<list>.*?)</tr>#is', $table, $matches);
               
                if (count($matches['list'])) {
                    foreach ($matches['list'] as $line) {
                        $matches = array();
                        $pattern = '<td\s*class="iname">';
                        $pattern .= '.*?<a.*?>(?P<currency_digit>\d+|)(?P<currency_name>.*?)</a>';// чуток поправил паттерн
                        $pattern .= '.*?<td.*?>.*?(?P<cur1>[0-9.]+)';
                      
                        preg_match('#' . $pattern . '#is', $line, $matches);
                        if (count($matches)) {
                            $currencyListNbu[$matches['currency_name']] = array(
                                 'cash' => number_format($matches['cur1'], 2, '.', ' ')
                                );
                         }
                    }
                }
            }
			
			if (count($currencyListNbu)) {
			
				$currencyList['NBU'] = $currencyListNbu;
			
			}
           
            if (count($currencyList)) {
                 $cacheEver->save('CURS',$currencyList);
            } else {
                 $currencyList = $cacheEver->load('CURS');
               // K_Log_Syslog::write();  @to-do сделать оповищение о ошибке парсинга  
            }
            $cache24h->save('CURS',$currencyList);
        } else {
            $currencyList = $cache24h->load('CURS');
        }
        return $currencyList;
    }
    
}
