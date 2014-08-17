package com.sot.game.helpers 
{
	import com.sot.game.data.SlotItemsData;
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
		//[Embed(source="../../../../../asset/animations/slots/1.swf", mimeType="application/octet-stream")]
		//private static var slot1:Class;
		//
		//[Embed(source="../../../../../asset/animations/slots/2.swf", mimeType="application/octet-stream")]
		//private static var slot2:Class;
		//
		//[Embed(source="../../../../../asset/animations/slots/3.swf", mimeType="application/octet-stream")]
		//private static var slot3:Class;
		//
		//[Embed(source="../../../../../asset/animations/slots/4.swf", mimeType="application/octet-stream")]
		//private static var slot4:Class;
		//
		//[Embed(source="../../../../../asset/animations/slots/5.swf", mimeType="application/octet-stream")]
		//private static var slot5:Class;
		//
		//[Embed(source="../../../../../asset/animations/slots/6.swf", mimeType="application/octet-stream")]
		//private static var slot6:Class;
		//
		//[Embed(source="../../../../../asset/animations/slots/7.swf", mimeType="application/octet-stream")]
		//private static var slot7:Class;
		//
		//[Embed(source="../../../../../asset/animations/slots/8.swf", mimeType="application/octet-stream")]
		//private static var slot8:Class;
		//
		//[Embed(source="../../../../../asset/animations/slots/9.swf", mimeType="application/octet-stream")]
		//private static var slot9:Class;
		//
		//[Embed(source="../../../../../asset/animations/slots/10.swf", mimeType="application/octet-stream")]
		//private static var slot10:Class;
		
		private static var _data:Dictionary = new Dictionary(true);
		
		public function Animations() 
		{
			
		}
		
		public static function init():void
		{
			/*_data['slot1'] = (new slot1);// as Sprite);
			_data['slot2'] = (new slot2);// as Sprite);
			_data['slot3'] = (new slot3);// as Sprite);
			_data['slot4'] = (new slot4);// as Sprite);
			_data['slot5'] = (new slot5);// as Sprite);
			_data['slot6'] = (new slot6);// as Sprite);
			_data['slot7'] = (new slot7);// as Sprite);
			_data['slot8'] = (new slot8);// as Sprite);
			_data['slot9'] = (new slot9);// as Sprite);
			_data['slot10'] = (new slot10);// as Sprite);*/
			
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