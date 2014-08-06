package com.sot.game.parserData 
{
	import com.sot.game.data.DataStorage;
	import com.sot.game.data.SlotItemsData;
	import com.sot.game.data.TxtFieldsData;
	import com.sot.game.events.GameEvents;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Vitalii
	 */
	public class ParserXML extends EventDispatcher
	{
		private var _xmlLoader:URLLoader = new URLLoader();
		private var _xmlData:XML;
		
		public function ParserXML() 
		{
			_xmlLoader.addEventListener(Event.COMPLETE, loadXml);
			_xmlLoader.load(new URLRequest("data.xml"));
		}
		
		private function loadXml(e:Event):void 
		{
			_xmlData = new XML(e.target.data);
			parseData(_xmlData);
		}
		
		private function parseData(xmlData:XML):void 
		{
			var itemsList:XMLList = xmlData.items.item;
			var data:Object = { };
			for each(var item:* in itemsList)
			{
				var ind:int = item.item.@name;
				data[ind] = { };
				data[ind]['joker'] = String(item.item.@joker);
			}
			SlotItemsData.instance().setData(data);
			
			var textsList:XMLList = xmlData.textfields.textfield;
			var dataTexts:Object = { };
			for each(var txt:* in textsList)
			{
				var txtName:String = txt.textfield.@name;
				dataTexts[txtName] = { };
				dataTexts[txtName]['name'] = String(txt.textfield.@name);
				dataTexts[txtName]['x'] = String(txt.textfield.@x);
				dataTexts[txtName]['y'] = String(txt.textfield.@y);
				dataTexts[txtName]['color'] = String(txt.textfield.@color);
				dataTexts[txtName]['type'] = String(txt.textfield.@type);
				
				TxtFieldsData.instance().countFields += 1;
			}
			TxtFieldsData.instance().setData(dataTexts);
			
			dispatchEvent(new GameEvents(GameEvents.XML_COMPLETE));
		}
		
	}

}