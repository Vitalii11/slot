package com.sot.game.data 
{
	/**
	 * ...
	 * @author Vitalii
	 */
	public class SlotItemsData 
	{
		private static var _slotItemsData:SlotItemsData;
		
		private static var _countSlots:int = 13;
		
		private static var itemsXMLData:Object;
		
		public function SlotItemsData() 
		{
			if (_slotItemsData)
				throw new Error("Use singleton");
			else {
				_slotItemsData = this;
			}
		}
		
		public static function instance():SlotItemsData
		{
			return _slotItemsData;
		}
		
		
		public function setData(data:Object):void
		{
			
			for (var param:* in data) {
				//парсим данные 
				
			}
		}
		
		static public function get countSlots():int 
		{
			return _countSlots;
		}
		
	}

}