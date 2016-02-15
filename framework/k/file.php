<?php 

class K_File{
    
    /** читает все файлы из директории и возвращяет в виде списка
    *
    * 
    * 
    * 
    * 
    */
    
    public static function rdir($dir){
   
           if(!is_dir($dir)){
               
               return false;
           }
        
           $filesNames = array();
        
           if ($handle = opendir($dir)) {
                while (false !== ($file = readdir($handle))) { 
                    if ($file != "." && $file != "..") { 
                        $filesNames[] = $file;
                    } 
                }
                closedir($handle); 
           }
           
           return  $filesNames;
           
    }
    
}






?>