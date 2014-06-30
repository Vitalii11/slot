//BaseSlotEngine

package com.sot.baseEngine.valueObjects
{
	
	/**
	*
	*@author Artem.Fedorov
	*/
	
	public class ServerDataVO
	{
		private var _message	:String;
		private var _data		:Object;
		private var _callBack	:Function;
		
		public function ServerDataVO($message:String = null, $data:Object = null, $callBack:Function = null)
		{
			message  = $message;
			data     = $data;
			callBack = $callBack;
		}
		//--------------------------------------------------------------------------
		//
		//  Getters&setters
		//
		//--------------------------------------------------------------------------
		public function get callBack():Function
		{
			return _callBack;
		}
		
		public function set callBack(value:Function):void
		{
			_callBack = value;
		}
		
		public function get data():Object
		{
			return _data;
		}
		
		public function set data(value:Object):void
		{
			_data = value;
		}
		
		public function get message():String
		{
			return _message;
		}
		
		public function set message(value:String):void
		{
			_message = value;
		}
	}
}