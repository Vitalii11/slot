package com.sot.game.data 
{
	/**
	 * ...
	 * @author Vitalii
	 */
	public class ReelData 
	{
		private static var _reelData:ReelData;
		
		private var _reelsCount:int;
		private var _slotItemsCount:int;
		
		public function ReelData() 
		{
			if (_dataStorage)
				throw new Error("Use singleton");
			else {
				_reelData = new this();
			}
		}
		
		public static function instance():DataStorage
		{
			return _reelData;
		}
		
		
		
		public function setData(data:Object):void
		{
			for (var param:* in data) {
				//парсим данные 
			}
		}
		
		
		
		
		//  setter / getter
		public function get reelsCount():int 
		{
			return _reelsCount;
		}
		
		public function set reelsCount(value:int):void 
		{
			_reelsCount = value;
		}
		
		public function get slotItemsCount():int 
		{
			return _slotItemsCount;
		}
		
		public function set slotItemsCount(value:int):void 
		{
			_slotItemsCount = value;
		}
		
	}

}