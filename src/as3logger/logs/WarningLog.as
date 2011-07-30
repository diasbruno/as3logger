package as3logger
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

import br.goodworkinteractive.as3logger.logs.ILog;
import br.goodworkinteractive.as3logger.logs.Log;

/**
 * Log a warning message.
 * 
 * @langversion ActionScript 3
 * @playerversion Flash 10.0.0
 * 
 * @author Bruno Dias
 * @since  28.03.2011
 */
public class WarningLog extends AbstractLog implements ILog
{
	
	//*
	//* Static & Constants
	//*
	
	/** @private Font tag. **/
	static private var OPEN_FONT_TAG:String = "<font color='#FF7F50'>";
	static private var CLOSE_FONT_TAG:String = "</font>";
	
	/**
	 * @constructor
	 * @param	warning	 String
	 * @param	writer	 Function
	 */
	public function WarningLog(message:String, writer:Function)
	{
		_log = new Log("warning", message)
		writer(OPEN_FONT_TAG);
		writer("*  "+_log.message);
		writer(CLOSE_FONT_TAG);
	}

}// class
}// package