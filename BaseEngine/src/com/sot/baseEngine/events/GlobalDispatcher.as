//BaseEngine

package com.sot.baseEngine.events
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	
	/*
	*
	*@author Artem.Fedorov
	*/
	
	public class GlobalDispatcher extends EventDispatcher
	{
		private static var _dispatcher:EventDispatcher = new EventDispatcher();
		private static var _listenersList:Dictionary = new Dictionary();
		

		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		 /**
		  * 
		  * @param event
		  * 
		  */		
	     public static function dispatch(event:Event):void
		{
			_dispatcher.dispatchEvent(event);
		}
		 
		 /**
		  * 
		  * @param $type
		  * @param $handler
		  * 
		  */		 
		 public static function addListener($type:String, $handler:Function):void
		 {
			 if(!$type) return;
			 _listenersList[$type] = $handler;
			 _dispatcher.addEventListener($type, $handler);
		 }
		 
		 /**
		  * 
		  * @param $type
		  * 
		  */		 
		 public static function removeListener($type:String):void
		 {
			if(_listenersList[$type] == null) return;
			 _dispatcher.removeEventListener($type, _listenersList[$type]);
			 _listenersList[$type] = null;
		 }
		 
		 /**
		  * 
		  * 
		  */		 
		 public static function removeAllListeners():void
		 {
			for (var item:String in _listenersList)
			{
				if(_listenersList[item] != null) 
				{
					_dispatcher.removeEventListener(item, _listenersList[item]);
					_listenersList[item] = null;
				}
			}
		 }
		 
		//--------------------------------------------------------------------------
		//
		//  Getters&setters
		//
		//--------------------------------------------------------------------------
		//--------------------------------------------------------------------------
		//
		//  Logs
		//
		//--------------------------------------------------------------------------
		 
	}
}