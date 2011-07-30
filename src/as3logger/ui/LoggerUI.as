package as3logger.ui
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

import br.goodworkinteractive.as3logger.utils.LoggerUtils;

import flash.display.Graphics;
import flash.display.Sprite;
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

/**
 * Logger clip.
 * 
 * @langversion ActionScript 3
 * @playerversion Flash 10.0.0
 * 
 * @author Victor Potasso
 * @author Bruno Dias
 * @since  23.03.2011
 */
//TODO: implement method to reset all fields.
public class LoggerUI extends Sprite
{
	
	//*
	//* Static & Constants
	//*
	
	/** @private Padding of text fields. **/
	static private const PADDING	    :Number = 10;
	static private const SCROLL 	    :Number = 50;
	static private const RETURN         :String = "\n";
	
	static private var LINES_STYLE		:TextFormat     = new TextFormat("Tahoma", 12, 0x444444,null,null,null,null,null, "right");
	static private var TIMESTAMP_STYLE  :TextFormat = new TextFormat("Tahoma", 12, 0xFFFFFF,null,null,null,null,null, "center");
	static private var FIELD_STYLE	    :TextFormat	  = new TextFormat("Tahoma", 12, 0xFFFFFF,null,null,null,null,null, "left");
	
	static private var _line            :Number = 1;
	
	/**
	 * @constructor
	 */
	public function LoggerUI() :void
	{
		_lineNumber 					= new TextField();
		_timestamp  					= new TextField();
		_log 							= new TextField();
			
		_lineNumber.multiline 			= true;
		_timestamp.multiline  			= true;
		_log.multiline 		  			= true;
			
		_lineNumber.autoSize 			= TextFieldAutoSize.LEFT;
		_timestamp.autoSize 			= TextFieldAutoSize.LEFT;
		_log.autoSize 					= TextFieldAutoSize.LEFT;
		
		_lineNumber.width 				= 30 - PADDING;
		_timestamp.width  				= 66;
		
		_lineNumber.defaultTextFormat 	= LINES_STYLE;
		_timestamp.defaultTextFormat  	= TIMESTAMP_STYLE;
		_log.defaultTextFormat        	= FIELD_STYLE;
		
		addEventListener(Event.ADDED_TO_STAGE, eventsHandler, false, 0, true);
	}
	
	//*
	//* Properties
	//*
	
	/** @private Fields. **/
	private var _lineNumber				:TextField;
	private var _timestamp				:TextField;
	private var _log 					:TextField;
	
	/** @private Colors. **/
	private var _fieldTextColor 		:Number;
	private var _fieldTextColorHighlight:Number;
	
	//*
	//* Methods
	//*
	
	/** @private Initialize. **/
	private function initialize() :void
	{
		if (stage)
		{
			stage.addEventListener(Event.RESIZE, eventsHandler, false, 0, true);
			drawBackground();
			align();
		}
		
		addChild(_lineNumber);
		addChild(_timestamp);
		addChild(_log);
		
		organizeLayout();
	}
	
	/**
	 * @private
	 * Align the ui.
	 */
	private function align() :void
	{
		x = y = 0;
	}
	
	/**
	 * @private
	 * Draws the background of the ui.
	 */
	private function drawBackground() :void
	{
		var gr:Graphics = graphics;
		if(stage)
		{
			gr.clear();
			gr.beginFill(0x666666, .9);
			gr.drawRect(0,0,(stage.stageWidth/4)*3,stage.stageHeight);
			gr.beginFill(0xD1D1D1, .9);
			gr.drawRect(0,0,40,stage.stageHeight);
			gr.endFill();
		}
	}
	
	/**
	 * @private
	 * Organize layout.
	 */
	private function organizeLayout() :void
	{
		_lineNumber.x = _lineNumber.y = _timestamp.y      = _log.y = PADDING;
		_timestamp.x  = _lineNumber.x + _lineNumber.width + (PADDING * 3);
		_log.x 		  = _timestamp.x  + _timestamp.width  + (PADDING * 6);
		
		_lineNumber.height = _timestamp.height = _log.height = stage.height - (PADDING * 2);
		
		_log.wordWrap = true;
		
		_log.width = ((stage.stageWidth/4)*3) - (_timestamp.x + _timestamp.width + (PADDING * 2));
	}
	
	/**
	 * @public
	 * Log scrolling ;]
	 * @param message String
	 * @param type String ["down" or "up"]
	 */
	public function scrolling(side:String) :void
	{
		switch(side)
		{
			case "down":
				if(_lineNumber.y < PADDING)
				{
					_lineNumber.y += SCROLL;
					_timestamp.y  += SCROLL;
					_log.y        += SCROLL;
				}
				break
			
			case "up":
				if(_lineNumber.height > stage.stageHeight - PADDING && _lineNumber.y > -(_lineNumber.height - stage.stageHeight))
				{
					_lineNumber.y -= SCROLL;
					_timestamp.y  -= SCROLL;
					_log.y        -= SCROLL;	
				}
				break
		}
	}
	
	/**
	 * @public
	 * Write a log on the TextField.
	 * @param text String
	 */
	public function write(text:String) :void
	{
		_lineNumber.appendText((_line++).toString()    + RETURN);
		_timestamp .appendText(LoggerUtils.timestamp() + RETURN);
		_log.htmlText += text + "<br>";
	}
	
	//*
	//* Events
	//*
	
	/**
	 * @private
	 * Handle all events dispatched as Event.
	 * @param event Event
	 */
	private function eventsHandler(event:Event) :void
	{
		switch (event.type)
		{
			case Event.ADDED_TO_STAGE :
				initialize();
			break;
			
			case Event.RESIZE :
				drawBackground();
				align();
			break;
		}
	}

}// class
}// package