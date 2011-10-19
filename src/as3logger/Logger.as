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

<<<<<<< HEAD
=======
import as3logger.logs.Logs;
import as3logger.utils.LoggerUtils;

>>>>>>> origin/master
import as3logger.logs.*;
import as3logger.ui.LoggerUI;
import as3logger.utils.LoggerUtils;

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
	
	/**
	 * Logger types
	 */
	static public const LOG:uint = 0;
	static public const WARNING:uint = 1;
	static public const ERROR:uint = 2;

	//*
	//* Statics & Contantes
	//*
	
	/** @private Version. **/
	static private const VERSION:String = "0.1";
	
	/** @private Specify if the Logger was configured. **/
	static private var _configured:Boolean=false;
	
	/** @private References. **/
	static private var _stage:Sprite = null;
	static private var _ui:LoggerUI;
	
	//*
	//*  Methods
	//*

//: config

	/**
	 * Set any configuration to Logger starts.
	 * @param stage	            Stage reference.
	 */
	static public function config(stage:Sprite) :void
	{
		trace("Logger::config()");
		_stage = stage;
		
		_ui = new LoggerUI();
		
		_stage.addChild(_ui);
		_ui.visible = false; // init false;
		_stage.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyboardEventsHandler, false, 0, true);
		
		Logs.initialize();
		
		_configured = true;
	}
	
//: log

	/**
	 * Log what you want! =)
	 *
	 * @param message Message
	 * @param type Type of your log message. (Logger.LOG | Logger.WARNING | Logger.ERROR)
	 * 
	 * Note: The rest was removed to avoid multiple messages, so each message can has a type 
	 * and it give us possibility to store them.
	 */
	static public function log(message:*, type:uint = 0) :void
	{
		trace("Logger::log()");
		var ilog:ILog;
		if (_configured) 
		{
			switch (type)
			{
				case ERROR : ilog = new ErrorLog(message, _ui.write); break;
				case WARNING : ilog = new WarningLog(message, _ui.write); break;
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
			case 83: _ui.visible = true; 	  break;
			case 72: _ui.visible = false; 	  break;
			case 38: _ui.scrolling("up");     break;
			case 40: _ui.scrolling("down");   break;
		}
	}

}// class
}// package