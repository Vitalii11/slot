//BaseEngine

package com.sot.baseEngine.events
{
	import flash.events.Event;
	
	/**
	*
	* @author Artem.Fedorov
	*/
	public class ApplicationEvents extends Event
	{
		
		private var _params:Object;
		
		public function ApplicationEvents(type:String, param:Object = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_params = param;
			super(type, bubbles, cancelable);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		//--------------------------------------------------------------------------
		//
		//  Events handlers
		//
		//--------------------------------------------------------------------------
		//--------------------------------------------------------------------------
		//
		//  Getters&setters
		//
		//--------------------------------------------------------------------------
		public function get params():Object 
		{
			return _params;
		}
		//--------------------------------------------------------------------------
		//
		//  Logs
		//
		//--------------------------------------------------------------------------
	}
}