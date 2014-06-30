package com.sot.baseEngine.controllers 
{
	import com.adobe.serialization.json.JSON;
	import com.sot.baseEngine.Facade;
	import com.sot.baseEngine.events.ApplicationEvents;
	import com.sot.baseEngine.events.GlobalDispatcher;
	import com.sot.baseEngine.model.ModelEventConstants;
	import com.sot.baseEngine.superClasses.BaseClass;
	import com.sot.baseEngine.valueObjects.ServerDataVO;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	/**
	 * ...
	 * @author rocket
	 */
	public class HTTPServerController extends BaseClass
	{		
		private var _urlLoader		:URLLoader;
		private var _urlVariables	:URLVariables;
		private var _urlRequest		:URLRequest;
		
		private var _callbackFunction:Function;
		
		protected var _gameName:String;
		
		public function HTTPServerController($callbackFunction:Function) 
		{
			_callbackFunction = $callbackFunction;
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		/**
		 *Регистрация компоненента 
		 * 
		 */		
		override protected function onRegister():void
		{
			init();
		}
		
		/**
		 * Инициализация
		 */
		private function init():void 
		{
			_urlVariables = new URLVariables();
			
			_urlRequest = new URLRequest();
			_urlRequest.url = Facade.baseEngineModel.config.mainURL;
			_urlRequest.method = URLRequestMethod.POST;
			_urlRequest.data = _urlVariables;
			
			_urlLoader = new URLLoader();
			_urlLoader.addEventListener(Event.COMPLETE, onServerCompleteHandler);
			_urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onServerErrorHandler);
		}
		
		/**
		 * Функция отправки запроса на сервер
		 * 
		 */		
		public function send($dataToSend:Object):void
		{
			_urlVariables.data = JSON.encode($dataToSend);
			trace("REQUEST:", _urlVariables.data);
			_urlLoader.load(_urlRequest);
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Events handlers
		//
		//--------------------------------------------------------------------------
		/**
		 *  
		 * @param e
		 * 
		 */		
		private function onServerCompleteHandler(e:Event):void 
		{
			trace("RESPONSE:", e.target.data);
			_callbackFunction(e);
		}
		
		/**
		 * Ошибка загрузки
		 * @param	e
		 */
		private function onServerErrorHandler(e:IOErrorEvent):void 
		{
			trace("Server ERROR", e.text);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getters&setters
		//
		//--------------------------------------------------------------------------
		
		public function get gameName():String
		{
			return _gameName;
		}
		
		public function set gameName(value:String):void
		{
			_gameName = value;
		}
		//--------------------------------------------------------------------------
		//
		//  Logs
		//
		//--------------------------------------------------------------------------
		
	}

}