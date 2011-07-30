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
	 * Log.
	 * Memento.
	 * 
	 * @langversion ActionScript 3
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Bruno Dias
	 * @since  28.03.2011
	 */
	public class Log
	{
		
		/**
		 * Log.
		 * [Memento]
		 * 
		 * @param type String
		 * @param message String
		 */
		public function Log(type:String, message:String = "") :void
		{
			_type = type;
			_message = message;
		}
		
		//*
		//* Properties
		//*
		
		/** @private Type of the log. **/
		static private var _type:String = "";
		
		/** @private Message. **/
		static private var _message:String = "";
		
		//*
		//* Getters & Setters
		//*
		
		/**
		 * @return Type.
		 */
		public function get type() :String { return _type; }
		
		/**
		 * @return Message.
		 */
		public function get message() :String { return _message; }
		
	}

}