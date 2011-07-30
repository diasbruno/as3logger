package as3logger.utils
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

import flash.system.Capabilities;

/**
 * Logger utils.
 * 
 * @langversion ActionScript 3
 * @playerversion Flash 9.0.0
 * 
 * @author Bruno Dias
 * @since  26.03.2011
 */
public class LoggerUtils
{
	
	/**
	 * @private
	 * Return the timestamp formatted as [hh:mm:ss].
	 * @return String
	 */
	static public function timestamp() :String
	{
		var date:Date = new Date(),
			formatDate:String = "";
		return "[" + fixTimeNumber(date.getHours()) + ":" + fixTimeNumber(date.getMinutes()) + ":" + fixTimeNumber(date.getSeconds()) + "]";
	}
	
	/**
	 * @private
	 * Fix number format to nn.
	 * @return String 
	 */
	static private function fixTimeNumber(number:uint) :String
	{
		var n:String = number.toString();
		return (number < 10) ? "0" + n : n;
	}
	
	static public function debugMode() :Boolean
	{
		return Capabilities.isDebugger;
	}
	
}// class
}// package