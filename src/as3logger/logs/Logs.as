package as3logger.logs
{

/**
 * @langversion ActionScript 3
 * @playerversion Flash 10.0.0
 * 
 * @author Bruno Dias 
 * @author Victor Potasso
 *
 * USAGE:
 *
 * TODO: complete usage.
 * TODO: implement the connection with Margarita.
 */

/**
 * Here is where we'll save all logs to be restored when necessary.
 * 
 * @langversion ActionScript 3
 * @playerversion Flash 9.0.0
 * 
 * @author Bruno Dias
 * @since  28.03.2011
 */
//TODO: implement methods to request logs by type and a specific by class.
public class Logs extends Object
{
	
	//*
	//* Statics & Constants
	//*
	
	/** @private Pool of logs. **/
	static private var logs:Vector.<Log>;
	
	static private var _initialized:Boolean = false;
	
	//*
	//* Methods
	//*
	
	/** @private Initialize. **/
	static public function initialize() :void
	{
		if (!_initialized)
		{
			_initialized = true;
			logs = new Vector.<Log>()
		}
	}
	
	/**
	 * Save a log on memento.
	 * @param	log	 Log
	 */
	static public function save(log:Log) :void
	{
		logs.push(log);
	}
	
	/**
	 * @return	The last log.
	 */
	static public function get last() :Log
	{
		var last:uint = logs.length -1;
		return logs[last];
	}

}// class
}// pakakge