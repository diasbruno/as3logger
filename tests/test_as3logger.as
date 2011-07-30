package 
{
	
import flash.display.Sprite;
import as3logger.Logger;

public class test_as3logger extends Sprite
{
	
	
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