package as3logger.logs
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
	
}// class
}// package