package game.data 
{
	/**
	 * ...
	 * @author Vitalii
	 */
	public class ButtonsData 
	{
		private static var _bttnsData:ButtonsData;
		
		private var _data:Object;
		
		private var _countBttns:int;
		
		public function ButtonsData() 
		{
			if (_bttnsData)
				throw new Error("Use singleton");
			else {
				_bttnsData = this;
			}
		}
		
		public static function instance():ButtonsData
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