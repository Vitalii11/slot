package game.helpers 
{
	import game.data.SlotItemsData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class Animations 
	{
		private static var _data:Dictionary = new Dictionary(true);
		
		public function Animations() 
		{
			
		}
		
		public static function init():void
		{
			for (var i:int = 0; i < SlotItemsData.countSlots; i++) 
			{
				var myLoader:Loader = new Loader();                     
				var url:URLRequest = new URLRequest(String((i+1)) + ".swf"); 
				myLoader.load(url);                                     
				_data['slot' + (i + 1)] = myLoader;
			}
		}
		
		public static function getByName(name:String):*
		{
			return _data[name].content;
		}
		
	}

}