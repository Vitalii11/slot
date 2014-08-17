package com.sot.game.parserData 
{
	import com.sot.game.data.ButtonsData;
	import com.sot.game.data.DataStorage;
	import com.sot.game.data.SlotItemsData;
	import com.sot.game.data.TxtFieldsData;
	import com.sot.game.events.GameEvents;
	import com.sot.game.wins.PayTableWindow;
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
			PayTableWindow.setData(itemXMLData);
			
			
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
			
			var bttnsList:XMLList = xmlData.buttons.button;
			var dataBttns:Object = { };
			for each(var bttn:* in bttnsList)
			{
				var bttnName:String = bttn.button.@name1;
				dataBttns[bttnName] = { };
				dataBttns[bttnName]['name1'] = String(bttn.button.@name1);
				dataBttns[bttnName]['name2'] = String(bttn.button.@name2);
				dataBttns[bttnName]['name3'] = String(bttn.button.@name3);
				dataBttns[bttnName]['x'] = String(bttn.button.@x);
				dataBttns[bttnName]['y'] = String(bttn.button.@y);
				dataBttns[bttnName]['width'] = int(bttn.button.@width);
				dataBttns[bttnName]['height'] = String(bttn.button.@height);
				dataBttns[bttnName]['type'] = String(bttn.button.@type);
				dataBttns[bttnName]['backing'] = String(bttn.button.@backing);
				dataBttns[bttnName]['color'] = int(bttn.button.@color);
				dataBttns[bttnName]['borderColor'] = int(bttn.button.@borderColor);
				dataBttns[bttnName]['fontSize'] = int(bttn.button.@fontSize);
				
				ButtonsData.instance().countBttns += 1;
			}
			ButtonsData.instance().setData(dataBttns);
			
			dispatchEvent(new GameEvents(GameEvents.XML_COMPLETE));
		}
		
	}

}