/**
 * Just sent us an e-mail, if you like this solution and/or want to contribute.
 * <hello@wemakegoodworks.com> =)
 */
package as3logger
{

/**
 * USAGE:
 * TODO: complete usage.
 * TODO: implement the connection with Margarita.
 */

import br.goodworkinteractive.as3logger.logs.*;
import br.goodworkinteractive.as3logger.ui.LoggerUI;
import br.goodworkinteractive.as3logger.utils.LoggerUtils;

import flash.display.Sprite;
import flash.display.Stage;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

/**
 * Logger manager..
 * 
 * @langversion ActionScript 3
 * @playerversion Flash 10.0.0
 * 
 * @author Bruno Dias 
 * @author Victor Potasso
 * @since  21.03.2011
 */
public class Logger
{
	
	//*
	//* Statics & Contantes
	//*
	
	/** @private Version. **/
	static private const VERSION:String = "0.1";
	
	/** @private Specify if the Logger was configured. **/
	static private var _configured:Boolean=false;
	
	/** @private References. **/
	static private var _stage:Stage = null;
	static private var _ui:LoggerUI;
	
	//*
	//*  Methods
	//*

//: config

	/**
	 * Set any configuration to Logger starts.
	 * @param stage	            Stage reference.
	 */
	static public function config(stage:Stage) :void
	{
		_stage = stage;
		
		_ui = new LoggerUI();
		
		_stage.addChild(_ui);
		_ui.visible = false; // init false;
		_stage.addEventListener(KeyboardEvent.KEY_DOWN, Logger.keyboardEventsHandler, false, 0, true);
		
		Logs.initialize();
		
		_configured = true;
	}
	
//: log

	/**
	 * Log what you want! =)
	 * @param message String
	 * @param type String
	 * 
	 * Note: The rest was removed to avoid multiple messages, so each message can has a type 
	 * and it give us possibility to store them.
	 */
	static public function log(message:*, type:String = "") :void
	{
		var ilog:ILog;
		if (_configured) 
		{
			switch (type)
			{
				case "error" : ilog = new ErrorLog(message, _ui.write); break;
				case "warning" : ilog = new WarningLog(message, _ui.write); break;
				default : ilog = new TraceLog(message, _ui.write); break;
			}
			Logs.save(ilog.message);
		} else trace("Logger error: Before start logging, you must configure. See Logger#config().");
	}
	
	//*
	//* Events
	//*
	
	/**
	 * @private
	 * Handle all events dispatched as KeyboardEvent.
	 * @param	event	KeyboardEvent
	 */
	static private function keyboardEventsHandler(event:KeyboardEvent) :void
	{
		switch (event.keyCode)
		{
			case 83:_ui.visible = true; 	 break;
			case 72:_ui.visible = false; 	 break;
			case 38:_ui.scrolling("up");     break;
			case 40:_ui.scrolling("down");   break;
		}
	}	
}// class
}// package