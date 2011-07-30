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
import br.goodworkinteractive.as3logger.utils.LoggerUtils;

import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;

/**
 * This type of log represents an error from project.
 * 
 * @langversion ActionScript 3
 * @playerversion Flash 9.0.0
 * 
 * @author Bruno Dias
 * @since  26.03.2011
 */
public class ErrorLog extends AbstractLog implements ILog
{
	
	//*
	//* Static & Constants
	//*
	
	/** @private Font tag. **/
	static private var OPEN_FONT_TAG:String = "<font color='#FF0000'>";
	static private var CLOSE_FONT_TAG:String = "</font>";
	
	/** @private Separator. **/
	static private var SEPARATOR:String = "------------------------------------------------------------";
	
	/**
	 * @constructor
	 * @param	error	 String.
	 * @param	writer	 Function.
	 */
	public function ErrorLog(error:Error, writer:Function)
	{
		var definition:Class = getDefinitionByName(error.name) as Class,
			explodeDebugError:Array, 
			explodeDebugErrorLen:uint, 
			i:uint=1;
		
		_log = new Log("", error.name);
		//log.message = "<font color='#FF0000'>"+error+"</font>";
		writer(OPEN_FONT_TAG);
			
		if (!LoggerUtils.debugMode()) 
		{
			writer("** "+error.name);
			writer("** #"+ error.errorID+" >"+error.message.split(":")[2]+CLOSE_FONT_TAG);
		} else {
			explodeDebugError = (definition(error).getStackTrace()).split("\n");
			explodeDebugErrorLen = explodeDebugError.length;
			
			writer("** #"+explodeDebugError[0]);
			for(;i<explodeDebugErrorLen; i++) writer("**  "+explodeDebugError[i]);
		}
		writer(CLOSE_FONT_TAG);
	}
	
}// class
}// package