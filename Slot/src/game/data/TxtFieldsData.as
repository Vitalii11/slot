package game.data 
{
	/**
	 * ...
	 * @author Vitalii
	 */
	public class TxtFieldsData 
	{
		private static var _txtFieldsData:TxtFieldsData;
		
		private var _data:Object;
		
		private var _countFields:uint;
		//private var _posX:int;
		//private var _posY:int;
		//private var _color:int;
		//private var _type:String;
		
		public function TxtFieldsData() 
		{
			if (_txtFieldsData)
				throw new Error("Use singleton");
			else {
				_txtFieldsData = this;
			}
		}
		
		public static function instance():TxtFieldsData
		{
			return _txtFieldsData;
		}
		
		public function setData(data:Object):void
		{
			_data = data;
		}
		
		public function getDataByName(name:String):Object
		{
			return _data[name];
		}
		
		public function get data():Object 
		{
			return _data;
		}
		
		
		public function get countFields():uint 
		{
			return _countFields;
		}
		
		public function set countFields(value:uint):void 
		{
			_countFields = value;
		}
		
		
		//public function get posX():int 
		//{
			//return _posX;
		//}
		//
		//public function set posX(value:int):void 
		//{
			//_posX = value;
		//}
		//
		//public function get posY():int 
		//{
			//return _posY;
		//}
		//
		//public function set posY(value:int):void 
		//{
			//_posY = value;
		//}
		//
		//public function get color():int 
		//{
			//return _color;
		//}
		//
		//public function set color(value:int):void 
		//{
			//_color = value;
		//}
		//
		//public function get type():String 
		//{
			//return _type;
		//}
		//
		//public function set type(value:String):void 
		//{
			//_type = value;
		//}
		
	}

}