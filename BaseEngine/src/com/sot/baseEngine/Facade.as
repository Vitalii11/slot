//BaseEngine

package com.sot.baseEngine
{
	import com.sot.baseEngine.controllers.ButtonsController;
	import com.sot.baseEngine.controllers.DictionaryController;
	import com.sot.baseEngine.controllers.GraphicsController;
	import com.sot.baseEngine.controllers.InterfaceController;
	import com.sot.baseEngine.controllers.ServerController;
	import com.sot.baseEngine.controllers.SoundController;
	import com.sot.baseEngine.model.BaseEngineModel;
	import com.sot.game.data.DataStorage;
	import com.sot.game.GameEnter;
	
	import flash.display.Stage;
	
	/**
	*
	*@author Artem.Fedorov
	*/
	
	public class Facade
	{
		public static var debugMode:Boolean = true;
		
		public static var serverData:Object;
		public static var baseEngineModel:BaseEngineModel;
		public static var myStage:Stage;
		public static var graphicsController:GraphicsController;
		public static var serverController:ServerController;
		public static var interfaceController:InterfaceController;
		public static var dictionaryController:DictionaryController;
		public static var soundController:SoundController;
		static public var mobileMode:Boolean;
		static public var settingsURL:String;
		static public var buttonsController:ButtonsController;
		
		
		
		static public var gameEnter:GameEnter;
		static public var data:DataStorage;;
	}
}