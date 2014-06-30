package com.sot.baseEngine.controllers 
{
	import com.adobe.serialization.json.JSON;
	import com.sot.baseEngine.Facade;
	import com.sot.baseEngine.superClasses.BaseClass;
	
	/**
	 * ...
	 * @author rocket
	 */
	public class ProxyController extends BaseClass 
	{
		
		public function ProxyController() 
		{
			super();
		}
		
		public function processingServerDataFromServer($data:*):Object
		{
			return JSON.decode($data);
		}
		
		public function processingDataToSetver($data:*, $gameName:String):Object
		{
			var dataToSend:Object = $data.data ? $data.data : new Object();
			
			dataToSend.customVars = Facade.myStage.loaderInfo.parameters.customVars;
			dataToSend.game = $gameName;
			dataToSend.action = $data.message;
			return dataToSend;
		}
		
	}

}