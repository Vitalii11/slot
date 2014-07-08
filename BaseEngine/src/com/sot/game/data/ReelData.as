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
		private var _slotItemsCount:int = 3;// test value
		
		public function ReelData() 
		{
			if (_reelData)
				throw new Error("Use singleton");
			else {
				_reelData = this;
			}
		}
		
		public static function instance():ReelData
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