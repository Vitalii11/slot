package com.sot.baseEngine.GameCheatMenu.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author rocket
	 */
	public class CheatEvents extends Event
	{
		private var _name:String;
		private var _data:Object;
		private var _bubbles:Boolean;
		
		public function CheatEvents($name:String, $data:Object = null, $bubbles:Boolean = false) 
		{
			super($name, $bubbles, false);
			_name = $name;
			_data = $data;
			_bubbles = $bubbles;
		}
		
		override public function clone():Event 
		{
			return new CheatEvents(_name, _data, _bubbles);
		}
		
		public function get data():Object { return _data; }
		
	}

}