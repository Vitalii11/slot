package com.sot.baseEngine.controllers 
{
	import com.adobe.serialization.json.JSON;
	import com.sot.baseEngine.Facade;
	import com.sot.baseEngine.superClasses.BaseClass;
	
	/**
	 * ...
	 * @author rocket
	 */
	public class ProxyControllerAlice extends BaseClass 
	{
		private var _initXML:XML = <client rnd="" sitehost="" sitepath="" query="" sessionguid="" playerguid="" lang="" verid="" command=""/>;	
		private var _spinXML:XML = <client session="" rnd="" command="">
										<game level="" table="" privacy="" id="" />
									</client>;
		
		public function ProxyControllerAlice() 
		{
			super();
		}
		
		public function processingServerDataFromServer($data:*):Object
		{
			return JSON.decode($data);
		}
		
		public function processingDataToSetver($data:*, $gameName:String):XML
		{
			var xmlToSend:XML = new XML();
			switch($data.message)
			{
				case "init":
					_initXML.@rnd = Math.random() * 100;
					_initXML.@playerguid = 1;
					_initXML.@lang = "ru";
					_initXML.@command = "connect";
					xmlToSend = _initXML;
					break;
				case "spin":
					_spinXML.@rnd = Math.random() * 100;
					_spinXML.@command = "start";
					_spinXML.game.@level = 1;
					_spinXML.game.@table = 1;
					_spinXML.game.@privacy = "private";
					_spinXML.game.@id = $gameName;
					xmlToSend = _spinXML;
					break;
			}
			return xmlToSend;
		}
		
	}

}