<?php 
/**
 * Syslog log writer.
 * @category   Logging
 */
class K_Log_Syslog extends K_Log_Writer {

	/**
	 * @var  string  The syslog identifier
	 */
	protected $_ident;

	/**
	 * @var  array  log levels
	 */
	protected $_syslog_levels = array('ERROR'    => LOG_ERR,
	                                  'CRITICAL' => LOG_CRIT,
	                                  'STRACE'   => LOG_ALERT,
	                                  'ALERT'    => LOG_WARNING,
	                                  'INFO'     => LOG_INFO,
	                                  'DEBUG'    => LOG_DEBUG);

	/**
	 * Creates a new syslog logger.
	 *
	 * @see http://us2.php.net/openlog
	 *
	 * @param   string  syslog identifier
	 * @param   int     facility to log to
	 * @return  void
	 */
	public function __construct($ident = 'KohanaPHP', $facility = LOG_USER)
	{
		$this->_ident = $ident;

		// Open the connection to syslog
		openlog($this->_ident, LOG_CONS, $facility);
	}

	/**
	 * Writes each of the messages into the syslog.
	 *
	 * @param   array   messages
	 * @return  void
	 */
	public function write(array $messages)
	{
		foreach ($messages as $message)
		{
			syslog($message['level'], $message['body']);
		}
	}

	/**
	 * Closes the syslog connection
	 *
	 * @return  void
	 */
	public function __destruct()
	{
		// Close connection to syslog
		closelog();
	}

} 
