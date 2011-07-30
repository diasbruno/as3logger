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

import as3logger.logs.ILog;

/**
 * Abstract log.
 * 
 * @langversion ActionScript 3
 * @playerversion Flash 10.0.0
 * 
 * @author Bruno Dias
 * @since  28.03.2011
 */
public class AbstractLog implements ILog
{
	
	//*
	//* Properties
	//*
	
	/** @private The way we will store the message. **/
	static protected var _log:Log = new Log("");
	
	
	//*
	//* Getters & Setters
	//*
	
	public function get message() :Log
	{
		return _log;
	}
	
}// class
}// package