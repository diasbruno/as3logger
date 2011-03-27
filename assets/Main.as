/**
 * AS3Logger Main Tester.
 * Tester.fla
 */
package
{
	
	import br.goodworkinteractive.as3logger.Logger;
	
	import flash.display.Sprite;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * Tester.
	 * 
	 * @langversion ActionScript 3
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Bruno Dias
	 * @since  26.03.2011
	 */
	public class Main extends Sprite
	{
		
		/**
		 * @constructor
		 */
		public function Main()
		{
			trace("Main::Main()");
			super();
			
			stage.align = "TL";
			stage.scaleMode = "noScale";
			
			Logger.config(stage, stage.stageWidth, stage.stageHeight);
			Logger.log("Test");
			
			var nullArray:Array;
			try{
				nullArray.push("item");
			} catch(e:Error) {Logger.log(e,"error");}
			
		}
	
	}

}