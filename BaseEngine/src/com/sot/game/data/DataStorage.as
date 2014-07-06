package com.sot.game.data 
{
	/**
	 * ...
	 * @author Vitalii
	 */
	public class DataStorage 
	{
		private static var _dataStorage:DataStorage;
		private static var _reelsStorage:ReelData;
		private static var _slotItemsStorage:SlotItemsData;
		
		private var _reelData:ReelData;
		private var _slotItemsData:ReelData;
		
		
		//general data:
		private var _countReels:int = 3; // for test
		
		//
		
		public function DataStorage() 
		{
			if (_dataStorage)
				throw new Error("Use singleton");
			else {
				_reelsStorage = new ReelData();
				_slotItemsStorage = new SlotItemsData();
				_dataStorage = new this();
			}
		}
		
		public static function instance():DataStorage
		{
			return _dataStorage;
		}
		
		
		
		public function setReelsData(data:Object):void
		{
			_reelData.setData(data);
		}
		
		public function setSlotItemsData(data:Object):void
		{
			_slotItemsData.setData(data);
		}
		
		
		//getters
		public function get reelData():ReelData 
		{
			return _reelData;
		}
		
		public function get slotItemsData():ReelData 
		{
			return _slotItemsData;
		}
		
		
		
		public function get countReels():int 
		{
			return _countReels;
		}
		
	}

}