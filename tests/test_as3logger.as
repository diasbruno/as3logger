package 
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

import as3logger.Logger;
	
import flash.display.Sprite;

/**
 * test unit.
 * 
 * @langversion ActionScript 3
 * @playerversion Flash 10.0.0
 * 
 * @author Bruno Dias 
 * @author Victor Potasso
 * @since  21.03.2011
 */
public class test_as3logger extends Sprite
{
	
	/**
	 *
	 */
	public function test_as3logger()
	{
		super();
		trace("test_as3logger::test_as3logger()");
		initialize();
	}

	public function initialize() :void
	{
		Logger.config(this);
		Logger.log("test_as3logger");
	}

}// class
}// package