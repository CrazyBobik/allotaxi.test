<?php 

/**
 * Class Debug
 * 
 * <example>
 * $model = new K_Db_Model();
 * $string = $model->name;
 * K_Debug::get()->enable( true );
 * K_Debug::get()->dump( $model );
 * K_Debug::get()->dump( $string );
 * K_Debug::get()->addMessage( '--- complete ---' );
 * K_Debug::get()->printAll();
 * K_Debug::get()->enable( false );
 * </example>
 */

class K_Debug {
	public $sqlList = array();
	public $errorList = array();
	public $messageList = array();
	public $dumpList = array();
	
	protected $elapse = 0; // start time
	
	protected static $instance = null;
	protected $enabled = true;
	
	protected static $copy = 0;
	public $myCopy = -1;
	
	protected function __construct() {
	  // require_once (WWW_PATH . '/ExtProce/debug/xhprof/xhprof_lib/utils/xhprof_lib.php');
      // require_once (WWW_PATH . '/ExtProce/debug/xhprof/xhprof_lib/utils/xhprof_runs.php');  
      //  xhprof_enable(XHPROF_FLAGS_CPU + XHPROF_FLAGS_MEMORY);  
  
       
		$this->enabled = true;
		self::$instance = $this;
		$this->elapse = K_Time::microtime_float();
	}
	
	// Enable or disable debug
	public function enable( $enable = true ) {
	   
		$this->enabled = $enable;
        
        if($this->enabled == true){
            
            if (!function_exists('vd'))
            {
                /**
                 * var_dump()
                 */
                function vd($string)
                {
                    var_dump($string);
                }
            }
            
            if (!function_exists('pr'))
            {
                /**
                 * print_r($string, $return)
                 */
                function pr($string, $return = FALSE)
                {
                    if ($return)
                    {
                        return print_r($string, TRUE);
                    }
                    else
                    {
                        print_r($string);
                    }
                }
            }
            
            if (!function_exists('vdd'))
            {
                /**
                 * var_dump() + die()
                 */
                function vdd($string)
                {
                    var_dump($string);
                    exit();
                }
            }
            
            if (!function_exists('prd'))
            {
                /**
                 * print_r($string, $return) + die()
                 */
                function prd($string, $return = FALSE)
                {
                    if ($return)
                    {
                        return print_r($string, TRUE);
                    }
                    else
                    {
                        print_r($string);
                    }
                    exit();
                }
            }
            
            if (!function_exists('gcm'))
            {
                /**
                 * get_class_methods($class)
                 */
                function gcm($class)
                {
                    return get_class_methods($class);
                }
            }
            
            if (!function_exists('e'))
            {
                /**
                 * echo($string)
                 */
                function e($string)
                {
                    print($string);
                }
            }
            
            if (!function_exists('d'))
            {
                /**
                 * die($string)
                 */
                function d($string = NULL)
                {
                    die($string);
                }
            }
           
        }
       
	}
	
	// Add SQL string message
	public function addSql( $text, $numRows = "N/A", $duration = "N/A" ) {
		$this->sqlList[] = 
			'<tr><td>'.(count($this->sqlList)+1).'. '.htmlspecialchars($text).'</td>'.
			'<td>'.$numRows.'</td><td>'.$duration.'</td></tr>';
	}
	
	// Add Error string message
	public function addError( $text ) {
		$this->errorList[] = (count($this->errorList)+1).'. '.htmlspecialchars($text).'<br/><br/>';
	}
	
	// Add simple message
	public function addMessage( $text ) {
		$this->messageList[] = (count($this->messageList)+1).'. '.htmlspecialchars($text).'<br/><br/>';
	}
	
	// Add object for dump
	public function dump( &$object, $name = null ) {
		$this->dumpList[] = array( 'object' => $object, 'name' => $name );
	}
	
	// Print all debug log to the screen
	public function printAll() {
		if ( !$this->enabled ) return;
		
		echo '<html><body><br/><div style="font-size:12px; font-family:arial">';
		if ( count($this->errorList) ) {
			echo '<strong style="color:red">Errors:</strong><br/>';
			foreach( $this->errorList as &$string ) {
				echo $string;
			}
			echo '<br/>';
		}
		
		if ( count($this->messageList) ) {
			echo '<strong style="color:green">Messages:</strong><br/>';
			foreach( $this->messageList as &$string ) {
				echo $string;
			}
			echo '<br/>';
		}
		
		if ( count($this->sqlList) ) {
		
			$strongList = array(
				'SELECT',
				'WHERE',
				'ORDER BY',
				'FROM',
				'GROUP BY',
				'HAVING',
				'LIMIT',
				'OFFSET',
				'AND',
				'OR',
				'NOT',
				'UPDATE',
				'INSERT INTO',
				'DUPLICATE KEY',
				'ON',
				'VALUES',
			);
		
			echo '<strong style="color:black">SQL:</strong><br/><table style="font-size:12px">'.
				 '<tr><th>Sql query</th><th>Return rows</th><th>Elapse</th></tr>';
			foreach( $this->sqlList as &$string ) {
				foreach( $strongList as $strongText ) {
					$string = str_replace( $strongText.' ', '<strong>'.$strongText.' </strong>', $string);
				}
				echo $string;
			}
			echo '</table><br/>';
		}
		
		if ( count($this->dumpList) ) {
			echo '<strong style="color:blue">Data dumps:</strong><br/>';
			$i = 1;
			foreach( $this->dumpList as &$item ) {				
				echo $i++.'.'.($item['name']?'<strong>'.$item['name'].'</strong>':'').'<br/>';
				var_dump( $item['object'] );
				echo '<br/>';
				echo '<br/>';
			}
			echo '<br/>';
		}
		
		$elapse = K_Time::microtime_float() - $this->elapse;
		echo 'Render time: '.$elapse.' s';
		
      //  $xhprof_data = xhprof_disable();
      // $xhprof_runs = new XHProfRuns_Default();
      //  $run_id = $xhprof_runs->save_run($xhprof_data, "xhprof_testing");
      // Формируем ссылку на данные профайлинга и записываем ее в консоль
      //  $link = "http://prof.loc/xhprof_html/index.php?run={$run_id}&source=xhprof_testing\n";
      //  echo '<br><a  href="'.$link.'">профайлер</a><br><br><br><br><br><br>';
        
		echo '</div></body></html>';
	}
	
	// Get K_Debug instance
	public static function get() {
		if ( !self::$instance ) {
			return new K_Debug();
		}
		return self::$instance;
	}
    
    // Отправляет сообщение в консоль браузера
	public static function consol($var) {
	   if(is_string($var)){
            echo "<script> console.log('{$var}')</script>";
         }
         else{
            echo  "<script> console.log('".print_r($var,true)."')</script>";
         }   
 	}
}

?>