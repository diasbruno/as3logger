/**
 * Just sent us an e-mail, if you like this solution and/or want to contribute.
 * <hello@wemakegoodworks.com> =)
 *
 * Copyright (c) 2011 GoodWork! Interactive.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package br.goodworkinteractive.as3logger.logs
{
	
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
	public class ErrorLog extends Log implements ILog
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
			
			_message = "<font color='#FF0000'>"+error+"</font>";
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
		
	}

}