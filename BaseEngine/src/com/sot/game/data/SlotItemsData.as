package com.sot.game.data 
{
	/**
	 * ...
	 * @author Vitalii
	 */
	public class SlotItemsData 
	{
		private static var _slotItemsData:SlotItemsData;
		
		public function SlotItemsData() 
		{
			if (_dataStorage)
				throw new Error("Use singleton");
			else {
				_slotItemsData = new SlotItemsData();
			}
		}
		
		public static function getSingleton():DataStorage
		{
			return _slotItemsData;
		}
		
		
		
		public function setData(data:Object):void
		{
			for (var param:* in data) {
				//парсим данные 
			}
		}
		
	}

}