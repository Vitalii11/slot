package com.sot.game.data 
{
	/**
	 * ...
	 * @author Vitalii
	 */
	public class BttnsData 
	{
		private static var _bttnsData:BttnsData;
		
		private var _data:Object;
		
		private var _countBttns:int;
		
		public function BttnsData() 
		{
			if (_bttnsData)
				throw new Error("Use singleton");
			else {
				_bttnsData = this;
			}
		}
		
		public static function instance():BttnsData
		{
			return _bttnsData;
		}
		
		public function setData(data:Object):void
		{
			_data = data;
		}
		
		public function get data():Object 
		{
			return _data;
		}
		
		public function get countBttns():int 
		{
			return _countBttns;
		}
		
		public function set countBttns(value:int):void 
		{
			_countBttns = value;
		}
		
	}

}