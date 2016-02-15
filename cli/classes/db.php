<?php
class _DB {

  public static function connSettings($settings) {
    static::$settings = $settings;
  }

  public static function Init() {
    if (!static::$inited) {
  
      //вместо ворнингов в лог мускул будет кидать эксепшены
      mysqli_report(MYSQLI_REPORT_STRICT);
      try {
      
        static::$connect = new mysqli(static::$settings['host'], static::$settings['login'], static::$settings['password'], static::$settings['dbname'], static::$settings['port'], static::$settings['socket']);
      
        static::$connect->query("SET NAMES '" .( static::$settings['codepage']? static::$settings['codepage']: 'utf8') . "'");
  
        static::$inited = TRUE;
      } catch (Exception $e) {
        echo "\nТехническое сообщение:\n Ошибка №" . $e->getCode() . ". " . $e->getMessage();
        //1045 - не вошел в бд.
        exit();
      }
    
    }
    return true;
  }

  static public function query($query) {
    if (!static::Init()) {
      return false;
    }
  
    static::$last_query = $query;
    static::$allqueries[] = $query;
    $t1 = microtime(true);
    $r = static::$connect->query($query);
    $t2 = microtime(true);
    static::$alltimes[] = $t2 - $t1;
    if ($r === false OR $r === true) {
      static::$allnumrows[] = $r ? 'OK' : 'FAIL';
    } else {
      static::$allnumrows[] = $r->num_rows;
    }
    
    return $r;
  }

  static public function escape($string) {
    if (!static::Init()) {
      return false;
    }
    return static::$connect->real_escape_string($string);
  }
  
  static public function e($string) {
   
    return self::escape($string);
	
  }
  
 	/**
     * Quote a raw string.
     *
     * @param string $value     Raw string
     * @return string           Quoted string
     */
    static public function qe($value)
    {
        if (is_int($value)) {
            return $value;
        } elseif (is_float($value)) {
            return sprintf('%F', $value);
        }
        return "'" . self::escape($value) . "'";
    }

  

  static public function id($query) {
    if (!static::query($query)) {
      return false;
    }
    $id = static::$connect->insert_id;
    return (int) $id;
  }

  /**
   * Выбор одного поля.
   * Возвращает значение указанного поля из первой строки результата
   * @param type $query
   * @param type $column
   * @return mixed
   */
  static public function one($query, $column) {
    $r = static::row($query, $column);
    return $r[0];
  }

  static public function row($query, $value_column = false) {
   
    $r = false;
    $result = static::query($query);
    if ($result !== false) {
      //return $result->fetch_all(MYSQLI_ASSOC);
      if ($row = $result->fetch_assoc()) {
        $r = ($value_column === false ? $row : $row[$value_column]);
      }
    }
  
    return $r;
  }

  /**
   * Возвращает массив как и assoc, но с айдишниками из БД в качестве ключей
   * @param string $query
   * @param string $value_column
   * @return Array&nbsp;or&nbsp;FALSE
   */
  static public function rowId($query, $value_column = false) {
  
    //возвращает массив как и assoc, но с айдишниками из БД в качестве ключей
    $r = false;
    $result = static::query($query);
    if ($result !== false) {
      //return $result->fetch_all(MYSQLI_ASSOC);
      $r = array();
      while ($row = $result->fetch_assoc()) {
        $r[$row['id']] = ($value_column === false ? $row : $row[$value_column]);
      }
    }
   
    return $r;
  }
  
   /**
   * Возвращает массив как и assoc, row['key']='value';
   * @param string $query
   * @param string $value_column
   * @return Array&nbsp;or&nbsp;FALSE
   */
  static public function assocKV($query, $value_column = false) {
  
    //возвращает массив как и assoc, но с айдишниками из БД в качестве ключей
    $r = false;
    $result = static::query($query);
    if ($result !== false) {
      //return $result->fetch_all(MYSQLI_ASSOC);
      $r = array();
      while ($row = $result->fetch_assoc()) {
        $r[$row['id']] = ($value_column === false ? $row : $row[$value_column]);
      }
    }
   
    return $r;
  }

  /**
   * Возвращает массив как и assoc, но в качестве ключей выступает значение $column
   *
   * @param string $query
   * @param string $column
   * @param string $value_column
   * @return Array&nbsp;or&nbsp;FALSE
   */
  static public function rowC($query, $column, $value_column = false) {
   
    //возвращает массив как и assoc, но в качестве ключей выступает значение $column
    $r = false;
    $result = static::query($query);
    if ($result !== false) {
      //return $result->fetch_all(MYSQLI_ASSOC);
      $r = array();
      while ($row = $result->fetch_assoc()) {
        $r[$row[$column]] = ($value_column === false ? $row : $row[$value_column]);
      }
    }
   
    return $r;
  }

  static public function rowS($query, $group_column, $id_column = false, $value_column = false) {

    //возвращает массив как и assoc, но с айдишниками из БД, сгруппированный в массивы по колонке
    $r = false;
    $result = static::query($query);
    if ($result !== false AND $result->num_rows > 0) {
      //return $result->fetch_all(MYSQLI_ASSOC);
      $id_column = ($id_column === false ? 'id' : $id_column);
      $r = array();
      if ($value_column === false) {
        while ($row = $result->fetch_assoc()) {
          $r[$row[$group_column]][$row[$id_column]] = $row;
        }
      } else {
        while ($row = $result->fetch_assoc()) {
          $r[$row[$group_column]][$row[$id_column]] = $row[$value_column];
        }
      }
    }

    return $r;
  }

  static public function count($table, $where = '') {
    $query = 'SELECT COUNT(*) FROM `' . $table . '`' . ( $where ? ' WHERE ' . $where : '');
    $r = static::query($query);
    if ($r) {
      $r = $r->fetch_row();
      return $r[0];
    }
    return false;
  }

  static public function value($table, $field, $id) {
    $query = "SELECT `$field` FROM `$table` WHERE `id`=$id";
    $r = static::query($query);
    if ($r === false) {
      return false;
    }
    $r = $r->fetch_row();
    return $r[0];
  }

  static public function firstrow($query, $lock = false) {
    $query .= ' LIMIT 1';
    if ($lock) {
      if (!static::$transaction) {
        throw new Exception('Can\'t lock row - transaction is not started');
      }
      $query .= ' FOR UPDATE';
    }
    $result = static::query($query);
    if ($result) {
      $row = $result->fetch_assoc();
      if ($row) {
        return $row;
      }
    }
    return false;
  }

  static public function FirstRowByID($table, $id, $lock = false) {
    $id = (int) $id;
    return static::firstrow('SELECT * FROM `' . static::escape($table) . '` WHERE `id` = ' . $id, $lock);
  }

  static public function collect($array, $column, $string = true, $delimiter = ', ') {
    $r = array();
    if (is_array($array)) {
      if (isset($array[$column])) {
        $r[] = $array[$column];
      } else {
        foreach ($array as $value) {
          $r = array_merge($r, static::collect($value, $column, false));
        }
      }
    }
    $r = array_unique($r);
    sort($r);
    if ($string === true) {
      $r = implode($delimiter, $r);
    }
    return $r;
  }

  public static function ShowQuery() {
    echo "<pre>SQL: " . static::$last_query . "</pre>\n<br>\n";
  }

  public static function StartTransaction() {
    if (static::$transaction) {
      throw new Exception('Transaction already started');
    }
    if (static::query('START TRANSACTION')) {
      static::$transaction = true;
      return true;
    } else {
      throw new Exception('Unable to start transaction');
    }
  }

  public static function Commit() {
    if (!static::$transaction) {
      throw new Exception('Transaction is not started');
    }
    static::$transaction = false;
    if (!static::query('COMMIT')) {
      throw new Exception('Unable to commit');
    }
    return true;
  }

  public static function Rollback($quiet = true) {
    if (!$quiet AND !static::$transaction) {
      throw new Exception('Transaction is not started');
    }
    static::$transaction = false;
    if (static::query('ROLLBACK')) {
      return true;
    } else {
      if (!$quiet) {
        throw new Exception('Unable to rollback');
      }
    }
  }

  public static function Report() {
    ob_start();
    $rand = rand(0, 999999);
    echo "Total " . count(static::$allqueries) . " queries in " . number_format(array_sum(static::$alltimes) * 1000, 3) . "ms <span style=\"cursor: pointer\" onclick=\"$('#queries$rand').toggle();\">[ + ]</span><br>
    <div id='queries$rand' style=\"font-family: monospace; display: none;\">Queries:<br>
    ";
    //. implode("<br><br>\n", DB::$allqueries) . "
    echo "<table class='style2'>";
    foreach (static::$allqueries as $key => $query) {

      echo "<tr><td class = 'right top' style = 'color: #909090;'>" . str_replace(' ', '&nbsp', number_format(static:: $alltimes[$key] * 1000, 3, '.', ' ')) . 'ms</td><td>'
      . ((static::$allnumrows[$key] === 'OK' OR static::$allnumrows[$key] === 'FAIL') ? static::$allnumrows[$key] : static::$allnumrows[$key] . '&nbsp;rows')
      . '</td><td>' . $query . "</td></tr>\n";
    }
    echo "</table>";
    echo "</div>";
    return ob_get_clean();
  }

}

class K_Query extends _DB {

  static public $connect = null;
  static protected $last_query = '';
  static protected $transaction = false;
  static protected $inited = false; //if DB::Init() was already called once
  static protected $settings = array();
  static protected $allqueries = array();
  static protected $alltimes = array();
  static protected $allnumrows = array();

}
