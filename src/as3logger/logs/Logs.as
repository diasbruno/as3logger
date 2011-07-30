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
	
	/**
	 * Here is where we'll save all logs to be restored when necessary.
	 * 
	 * @langversion ActionScript 3
	 * @playerversion Flash 9.0.0
	 * 
	 * @author Bruno Dias
	 * @since  28.03.2011
	 */
	//TODO: implement methods to request logs by type and a specific by class.
	public class Logs extends Object
	{
		
		//*
		//* Statics & Constants
		//*
		
		/** @private Pool of logs. **/
		static private var logs:Vector.<Log>;
		
		static private var _initialized:Boolean = false;
		
		//*
		//* Methods
		//*
		
		/** @private Initialize. **/
		static public function initialize() :void
		{
			if (!_initialized)
			{
				_initialized = true;
				logs = new Vector.<Log>()
			}
		}
		
		/**
		 * Save a log on memento.
		 * @param	log	 Log
		 */
		static public function save(log:Log) :void
		{
			logs.push(log);
		}
		
		/**
		 * @return	The last log.
		 */
		static public function get last() :Log
		{
			var last:uint = logs.length -1;
			return logs[last];
		}
	
	}

}
