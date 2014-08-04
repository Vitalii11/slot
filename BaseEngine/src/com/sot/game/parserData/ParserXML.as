package com.sot.game.parserData 
{
	import com.sot.game.data.DataStorage;
	import com.sot.game.data.SlotItemsData;
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
			
			//var taxList:XMLList = xmlData.products.tax;
			//
			//for each(var taxies:* in taxList)
			//{
				//var dataTax:Object = { };
				//
				//dataTax['code'] = String( taxies.item.@code)
				//dataTax['percent'] = Number(taxies.item.@percent);
				//dataTax['applies'] = String(taxies.item.@applies);
				//dataTax['exempt'] = String(taxies.item.@exempt);
				//
				//DataStorage.arrTaxes.push(dataTax);
			//}
			//
			dispatchEvent(new GameEvents(GameEvents.XML_COMPLETE));
		}
		
	}

}