//
//  TraceLog
//
//  Created by Bruno Dias on 2011-03-27.
//  Copyright (c) 2011 GoodWork! Interactive.. All rights reserved.
//

package br.goodworkinteractive.as3logger.logs
{
	
	import br.goodworkinteractive.as3logger.logs.ILog;
	import br.goodworkinteractive.as3logger.logs.Log;

	public class TraceLog extends Log implements ILog
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
			_message = message;
			writer(OPEN_FONT_TAG+_message+CLOSE_FONT_TAG);
		}
	
	}

}