//BaseEngine

package com.sot.baseEngine.model
{
	import com.adobe.crypto.MD5;
	import com.adobe.crypto.SHA256;
	import com.sot.baseEngine.Facade;
	import com.sot.baseEngine.events.ApplicationEvents;
	import com.sot.baseEngine.events.GlobalDispatcher;
	import com.sot.baseEngine.managers.FileManager;
	import com.sot.baseEngine.superClasses.BaseClass;
	import com.sot.baseEngine.valueObjects.ConfigurationVO;
	
	import flash.net.LocalConnection;
	
	
	/**
	*
	*@author Artem.Fedorov
	*/
	
	public class BaseEngineModel extends BaseClass
	{
		public static var SALT:String;
		
		public static var GAME_SALT:String;
		
		private var _config:ConfigurationVO;
		
		public function BaseEngineModel()
		{
			
			//super();
			
			
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------


		override protected function onRegister():void
		{
			GlobalDispatcher.addListener(ModelEventConstants.STARTUP, onStartUpHandler);
			GlobalDispatcher.addListener(ModelEventConstants.RESPONSE, onResponseHandler);
			init();
		}
		
		public function parseConfig($xml:XML):void
		{
			//for override
		}
		
		/**
		 * Инициализация FileManager
		 * 
		 */		
		private function init():void
		{
			//Facade.dictionaryController = new DictionaryController();
			FileManager.init();
		}
		
		
		private function checkDomainLevel($domain:String):int
		{
			var points:int;
			for(var i:int = 0; i < $domain.length; i++)
				if($domain.charAt(i) == ".") points++;
			return points;
		}
		
		private function getDomainStar($domain:String):String
		{
			var str:String = "";
			var i:int;
			while($domain.charAt(i) != ".") i++;
					
			for(var j:uint = i + 1; j < $domain.length; j++)
				str += $domain.charAt(j);
			
			return "*." + str;
		}
		
		private function cutWWW($domain:String):String
		{
			if($domain.indexOf("www") > -1 || $domain.indexOf("WWW") > -1)
				return $domain.substr(4);
			return $domain;
		}
		
		protected function checkDomain():Boolean
		{
			var lc:LocalConnection = new LocalConnection();
			var domain:String = cutWWW(lc.domain);
			trace(ModelEventConstants[_config.gameName]);
			trace(domain, ModelEventConstants[_config.gameName], _config.gameName);
			trace(MD5.hash(domain + ModelEventConstants[_config.gameName] + _config.gameName));
			var hash:String = MD5.hash(MD5.hash(domain + ModelEventConstants[_config.gameName] + _config.gameName) + SALT);
			trace("Хеш: ", hash+" FlashVars "+config.protectionKey);
			if(hash == _config.protectionKey) return true;
			else if(checkDomainLevel(domain) > 1)
			{
				hash = MD5.hash(MD5.hash(getDomainStar(domain) + ModelEventConstants[_config.gameName] + _config.gameName) + SALT);
				trace("Хеш*: ", hash);
				if(hash == _config.protectionKey) return true;
			}
			
			return false;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Events handlers
		//
		//--------------------------------------------------------------------------
		/**
		 * Инициализация графического контроллера создания и управления графикой.
		 * Создание события запуска игры.
		 * @param e
		 * 
		 */		
		protected function onAllFilesLoadedHandler(e:ApplicationEvents):void
		{
			//for override
		}		
		
		
		protected function onResponseHandler(e:ApplicationEvents):void
		{
			// for override
		}
		
		protected function onStartUpHandler(e:ApplicationEvents):void
		{
			// for override
		}
		//--------------------------------------------------------------------------
		//
		//  Getters&setters
		//
		//--------------------------------------------------------------------------
		public function get config():ConfigurationVO
		{
			return _config;
		}

		/**
		 *Получение config и инициализация загрузки данных 
		 * @param value
		 * 
		 */		
		public function setConfig(value:ConfigurationVO):void
		{
			_config = value;
			if(!Facade.mobileMode) if (!Facade.debugMode && !checkDomain()) return;
			GlobalDispatcher.addListener(ModelEventConstants.ALL_FILES_LOADED, onAllFilesLoadedHandler);
			GlobalDispatcher.dispatch(new ApplicationEvents(ModelEventConstants.CONFIG_UPDATED, value));
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Logs
		//
		//--------------------------------------------------------------------------
	}
}