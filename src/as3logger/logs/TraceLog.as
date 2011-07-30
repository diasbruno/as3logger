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

import br.goodworkinteractive.as3logger.logs.ILog;
import br.goodworkinteractive.as3logger.logs.Log;

/**
 * Write a normal log like a simple trace.
 * 
 * @langversion ActionScript 3
 * @playerversion Flash 9.0.0
 * 
 * @author Bruno Dias
 * @since  28.03.2011
 */
public class TraceLog extends AbstractLog implements ILog
{
	
	//*
	//* Static & Constants
	//*
	
	/** @private Font tag. **/
	static private var OPEN_FONT_TAG:String = "<font color='#FFFFFF'>";
	static private var CLOSE_FONT_TAG:String = "</font>";
	
	/**
	 * @constructor
	 * @param	error	 String.
	 * @param	writer	 Function.
	 */
	public function TraceLog(message:String, writer:Function)
	{
		_log = new Log("", message);
		writer(OPEN_FONT_TAG+_log.message+CLOSE_FONT_TAG);
	}

}// class
}// package