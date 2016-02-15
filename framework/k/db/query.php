<?php

class K_Db_Query {

	protected $db;
	
	public function __construct(&$adapter = null)
	{
		if (empty($adapter))
		{
			$this->db = &K_Db_Adapter::$defaultAdapter;
		}
		else
		{
			$this->setAdapter( $adapter );
		}
	}
	
	public function setAdapter(&$adapter)
	{
	   
		if ($adapter)
		{
			$this->db = &$adapter;
		}
        
	}
    
    /** @function query алиас для query 
     *  @param $sql - выполнить sql запрос
     */

	public static function query($sql, $noDbRow = false)
	{
	 
      $q = new K_Db_Query;
   	  return $q->q($sql, $noDbRow);
         
	}
    
    /** @function query алиас для query 
     *  @param $sql - выполнить sql запрос
     */

	public static function row($sql, $noDbRow = false)
	{
	 
      $q = new K_Db_Query;
      $r = $q->q($sql, $noDbRow);
      
      if(!$r){
        
        return false;
        
      }
      
      
      return $r[0];
         
	}
    
     /** @function query алиас для query 
     *  @param $sql - выполнить sql запрос
     */

	public static function one($sql, $key, $noDbRow = false)
	{
	  
      $q = new K_Db_Query;
      $r = $q->q($sql, $noDbRow);
     
      if(!$r){
        
        return false;
      
      }
       
       return $r[0][$key];
         
	}
    	
    /** @function q алиас для query 
     *  @param $sql - выполнить sql запрос
     *  @param $noDbRow - не использовать ActiveRecord записи $noDbRow
     */
    
	public function q($sql, $noDbRow = false)
	{
	   
      $this->db->noDbRow = $noDbRow;
		return $this->db->query($sql);
        
	}

}