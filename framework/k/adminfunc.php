<?php
class K_AdminFunc {     
     
     /** Функция возврящяет сформированный массив where
      *   
      * 
      * 
      */
         
    public static function where($fields, $pts) {
                      
        foreach($fields as $k=>$v){
            
             if(isset($pts[$k]) && !empty($pts[$k])){
                
                
             
                   if($_POST[$k] == "нет"){
                  
                       $where[] = $v.' IS NULL ';
                    
                    }else{
                     
                       $where[] = $v.' LIKE '.K_Db_Quote::quote($_POST[$k].'%');
                     
                    };
                
             }
             
        }
        
        return $where;
        
     }  
}        
?>            