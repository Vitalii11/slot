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
		private static var _txtFieldsStorage:TxtFieldsData;
		
		private var _reelData:ReelData;
		private var _slotItemsData:SlotItemsData;
		private var _txtFieldsData:TxtFieldsData;
		
		
		//general data:
		private var _countReels:int = 5; // for test
		private var _countItems:int = 15;
		
		private var _spaceItems:int = 15;
		
		private var _payTableSheets:int = 4;
		
		private var _credits:int = 10000;
		private var _speensCoast:int = 20;
		private var _speenCoast:int = 5;
		//
		
		public function DataStorage() 
		{
			if (_dataStorage)
				throw new Error("Use singleton");
			else {
				_reelsStorage = new ReelData();
				_slotItemsStorage = new SlotItemsData();
				_txtFieldsData = new TxtFieldsData();
				_dataStorage = this;
			}
		}
		
		public static function instance():DataStorage
		{
			return _dataStorage;
		}
		
		
		public function setData(data:Object):void
		{
			// parse data
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
		
		public function get slotItemsData():SlotItemsData 
		{
			return _slotItemsData;
		}
		
		public function get txtFieldsData():TxtFieldsData 
		{
			return _txtFieldsData;
		}
		
		
		
		public function get countReels():int 
		{
			return _countReels;
		}
		
		public function get countItems():int 
		{
			return _countItems;
		}
		
		public function get spaceItems():int 
		{
			return _spaceItems;
		}
		
		public function get payTableSheets():int 
		{
			return _payTableSheets;
		}
		
		public function get credits():int 
		{
			return _credits;
		}
		
		public function set credits(value:int):void 
		{
			_credits = value;
		}
		
		public function get speensCoast():int 
		{
			return _speensCoast;
		}
		
		public function set speensCoast(value:int):void 
		{
			_speensCoast = value;
		}
		
		public function get speenCoast():int 
		{
			return _speenCoast;
		}
		
		public function set speenCoast(value:int):void 
		{
			_speenCoast = value;
		}
		
	}

}