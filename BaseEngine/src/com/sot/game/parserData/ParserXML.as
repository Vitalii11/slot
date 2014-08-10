package com.sot.game.parserData 
{
	import com.sot.game.data.DataStorage;
	import com.sot.game.data.SlotItemsData;
	import com.sot.game.data.TxtFieldsData;
	import com.sot.game.events.GameEvents;
	import com.sot.game.win.PaytableWindow;
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
		private var itemXMLData:Object;
		
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
			itemXMLData = { };
			for each(var item:* in itemsList)
			{
				var ind:int = item.item.@name;
				itemXMLData[ind] = { };
				itemXMLData[ind]['joker'] = String(item.item.@joker);
				itemXMLData[ind]['wild'] = String(item.item.@wild);
				itemXMLData[ind]['paytable1'] = String(item.item.@paytable1);
				itemXMLData[ind]['paytable2'] = String(item.item.@paytable3);
				itemXMLData[ind]['paytable3'] = String(item.item.@paytable4);
				itemXMLData[ind]['paytable4'] = String(item.item.@paytable5);
				itemXMLData[ind]['animation'] = String(item.item.@animation);
				
			}
			//SlotItemsData.instance().setData(itemXMLData);
			PaytableWindow.setData(itemXMLData);
			
			
			var textsList:XMLList = xmlData.textfields.textfield;
			var dataTexts:Object = { };
			for each(var txt:* in textsList)
			{
				var txtName:String = txt.textfield.@name;
				dataTexts[txtName] = { };
				dataTexts[txtName]['name'] = String(txt.textfield.@name);
				dataTexts[txtName]['text'] = String(txt.textfield.@text);
				dataTexts[txtName]['x'] = String(txt.textfield.@x);
				dataTexts[txtName]['y'] = String(txt.textfield.@y);
				dataTexts[txtName]['color'] = int(txt.textfield.@color);
				dataTexts[txtName]['type'] = String(txt.textfield.@type);
				
				TxtFieldsData.instance().countFields += 1;
			}
			TxtFieldsData.instance().setData(dataTexts);
			
			dispatchEvent(new GameEvents(GameEvents.XML_COMPLETE));
		}
		
	}

}