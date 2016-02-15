<?php

/**

 */
class K_String {

    /** 
     * Удаляет последний слеш в строке если он есть.
     */
   public static function trimSlash($paramLink){
        if ($paramLink[strlen($paramLink) - 1] == '/') {
                     $paramLink = substr($paramLink, 0, strlen($paramLink)-1);
        }
        return  $paramLink;
   }
   
     /** 
     * Добовляет слеш в конце если его нет.
     */
   public static function addSlash($paramLink){
        if ($paramLink[strlen($paramLink) - 1] != '/') {
                     $paramLink .= '/';
        }
        return  $paramLink;
   }
 
 
    /** 
     * обрезает строку .
    */

    public static function trunc($string, $len, $dots = true, $enc = 'utf-8'){
     	$s = strip_tags($string);
        return mb_substr( $s, 0, $len, $enc) . ( mb_strlen($s, $enc) > $len ? ($dots? '...':'') : '');
    }
       
   public static function rus2lat($str) { 
        $str = str_replace(
            array("а", "б", "в", "г", "д", "е", "з", "и", "к", "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "ц", "ъ", "ы", "ь"),
            array("a", "b", "v", "g", "d", "e", "z", "i", "k", "l", "m", "n", "o", "p", "r", "s", "t", "u", "f", "с", "", "y", ""),
            $str
        );
               
        $str = str_replace(
            array("А", "Б", "В", "Г", "Д", "Е", "З", "И", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Ц", "Ъ", "Ы", "Ь"),
            array("A", "B", "V", "G", "D", "E", "Z", "I", "K", "L", "M", "N", "O", "P", "R", "S", "T", "U", "F", "С", "", "Y", ""),
            $str
        );
       
        $str = str_replace(
            array("э", "х", "й", "ё", "ж", "ч", "ш", "щ", "ю", "я", "Э", "Х", "Й", "Ё", "Ж", "Ч", "Ш", "Щ", "Ю", "Я"),
            array("eh", "kh", "jj", "jo", "zh", "ch", "sh", "shh", "ju", "ja", "EH", "KH", "JJ", "JO", "ZH", "CH", "SH", "SHH", "JU", "JA"),
            $str
        );
   
        return $str;
   } 

    public static function ucfirst($string) {  
          $string = mb_ereg_replace("^[\ ]+","", $string);  
          $string = mb_strtoupper(mb_substr($string, 0, 1, "UTF-8"), "UTF-8").mb_substr($string, 1, mb_strlen($string), "UTF-8" );  
          return $string;  
    }
      
	
/** 
   Обработка перед сравнением строк
 * Удаляет пробелы по концам, приводит к кодировке UTF-8 и нижнему кейсу символов. Основное использование в API
 */
 
	public static function preCmp($string) {  
	
		return 	mb_strtolower(self::specTrim($string), "UTF-8");
		
	}
	
/** 
   HTML трим - декодирует и удаляет безразрывные пробелы. Основное использование в API 
 */
	
	public static function specTrim($string)
	{
	
		return trim(trim(trim(htmlspecialchars_decode($string), "\xC2\xA0"), "\xA0"));
	
	}   
    
    
    
    public static function stripWords($string, $count)
	{
		$splice_pos = null;

		$ar = preg_split("/(<.*?>|\\s+)/s", $string, -1, PREG_SPLIT_DELIM_CAPTURE);
		foreach($ar as $i => $s)
		{
			if(substr($s, 0, 1) != "<")
			{
				$count -= strlen($s);
				if($count <= 0)
				{
					$splice_pos = $i;
					break;
				}
			}
		}

		if(isset($splice_pos))
		{
			array_splice($ar, $splice_pos+1);
			return implode('', $ar);
		}
		else
		{
			return $string;
		}
	}
  
   public static function closeTags($html)
	{
	   
        $not_close = array('br','img');
		preg_match_all("#<([a-z0-9]+)([^>]*)(?<!/)>#iu", $html, $result);
      
        foreach( $result[1] as $v){
            if(!in_array($v, $not_close)){
               $openedtags[] = $v;
            }
        }
        
    	preg_match_all("#</([a-z0-9]+)>#iu", $html, $result);
         
		$closedtags = $result[1];
     
		$len_opened = count($openedtags);

		if(count($closedtags) == $len_opened)
			return $html;

		$openedtags = array_reverse($openedtags);

		for($i = 0; $i < $len_opened; $i++)
		{
			if (!in_array($openedtags[$i], $closedtags))
				$html .= '</'.$openedtags[$i].'>';
			else
				unset($closedtags[array_search($openedtags[$i], $closedtags)]);
		}

		return $html;
	}
    
/// Сокращяет HTML строку и закрывает теги   

    public static function htmlСut($html, $size)
	{
		$symbols = strip_tags($html);
		$symbols_len = strlen($symbols);

		if($symbols_len < strlen($html))
		{
			$strip_text = self::stripWords($html, $size);

			if($symbols_len > $size)
				$strip_text = $strip_text."...";

			$final_text = self::closeTags($strip_text);
		}
		elseif($symbols_len > $size)
			$final_text = substr($html, 0, $size)."...";
		else
			$final_text = $html;

		return $final_text;
	}


/// Очистка и транслитерация урла  
	public static function urlClear($string){
		
		return preg_replace('/[\s]/iu', "-", preg_replace('/[^a-z0-9-\.]/i', "", self::rus2lat($string)));
			
	}
	 
/** 
removeUkr - Удаление украинских и чувашских символов ))	в основном используеться для API
 */		
 
	public static function removeUkr($str){ // by SiMM, $table from http://ru.wikipedia.org/wiki/CP1251
		
		return preg_replace('#([ІЇЄўЎiєїӐӖҪӲӑӗҫӳ])#iu', '', $str);
	
	}

  
}
