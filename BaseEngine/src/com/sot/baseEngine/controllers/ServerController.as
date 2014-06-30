//BaseEngine


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
	*
	*@author Artem.Fedorov
	*/
	
	public class ServerController extends BaseClass
	{
		/**
		 * @private
		 */
		private var _incomeQueue	:Vector.<ServerDataVO> = new Vector.<ServerDataVO>;
		private var _outcomeQueue	:Vector.<ServerDataVO> = new Vector.<ServerDataVO>;
		
		private var _urlLoader		:URLLoader;
		private var _urlVariables	:URLVariables;
		private var _urlRequest		:URLRequest;
		private var _dataFromServer	:Object;
		private var _currentAction	:String;
		private var _parentData		:Object;
		private var _incomeQueueBusy		:Boolean;
		private var _outcomeQueueBusy		:Boolean;
		
		protected var _gameName:String;
		
		private var _callbackFunction:Function;
		private var _serverProtocol:HTTPServerController;
		private var _proxyController:ProxyController;
		private var _proxyControllerAlice:ProxyControllerAlice;
		
		public function ServerController()
		{
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
			_serverProtocol = new HTTPServerController(onServerCompleteHandler);
			_proxyController = new ProxyController();
			_proxyControllerAlice = new ProxyControllerAlice();
		}
		
		/**
		 * Функция отправки запроса на сервер
		 * 
		 */		
		private function send($serverData:ServerDataVO):void
		{
			_serverProtocol.send(_proxyController.processingDataToSetver($serverData, gameName));
			var protocolTest:Object = _proxyControllerAlice.processingDataToSetver($serverData, gameName);
			trace("----- TEST ALICE PROTOCOL (REQUEST) -----");
			trace(protocolTest.toXMLString());
			trace("-----------------------------------------");

		}
		
		/**
		 * 
		 * @param $message:String
		 * @param $queue:String	  "out" = outcomeQueue; "in" = incomeQueue
		 * @param $priority:uint   0 = usual, 1 = urgent
		 */		
		public function putToQueue($serverData:ServerDataVO, $queue:String, $priority:uint = 0):void
		{
			if(($queue != "out" && $queue != "in") || ($priority != 0 && $priority != 1))
			{
				loggerAlert("Не могу добавить сообщение в очередь " + $queue + " с приоритетом " + $priority); 
				return;
			}
			
			switch($queue)
			{
				case "out":
					if($priority == 0) outcomeQueue.push($serverData)
					else if($priority == 1) outcomeQueue.unshift($serverData);
					if(!outcomeQueueBusy) 
					{
						send(outcomeQueue[0]);
					}
					break;
					
				case "in":
					if($priority == 0) incomeQueue.push($serverData)
					else if($priority == 1) incomeQueue.unshift($serverData);
					if(!incomeQueueBusy) 
					{	GlobalDispatcher.dispatch(new ApplicationEvents(ModelEventConstants.RESPONSE, incomeQueue));
						incomeQueueBusy = false;
					}
					break;
			}
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
			_dataFromServer = _proxyController.processingServerDataFromServer(e.target.data);
			trace("TEST ALICE PROTOCOL (RESPONCE)", _proxyControllerAlice.processingServerDataFromServer(e.target.data));
			putToQueue(new ServerDataVO(null, _dataFromServer, null), "in");
			outcomeQueueBusy = false;
			if (_callbackFunction != null)
				_callbackFunction();
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
		public function get outcomeQueueBusy():Boolean
		{
			return _outcomeQueueBusy;
		}
		
		public function set outcomeQueueBusy(value:Boolean):void
		{
			if(!value) 
			{
				outcomeQueue.shift();
				if(outcomeQueue.length > 0) send(outcomeQueue[0]);
			}
			_outcomeQueueBusy = value;
		}
		
		public function get incomeQueueBusy():Boolean
		{
			return _incomeQueueBusy;
		}
		
		public function set incomeQueueBusy(value:Boolean):void
		{
			if(!value) 
			{
				incomeQueue.shift();
				if(incomeQueue.length > 0)
					GlobalDispatcher.dispatch(new ApplicationEvents(ModelEventConstants.RESPONSE, incomeQueue));
			}
			_incomeQueueBusy = value;
		}

		/**
		 * Очереди 
		 */
		public function get incomeQueue():Vector.<ServerDataVO>
		{
			return _incomeQueue;
		}
		public function set incomeQueue(value:Vector.<ServerDataVO>):void
		{
			_incomeQueue = value;
		}
		
		public function get outcomeQueue():Vector.<ServerDataVO>
		{
			return _outcomeQueue;
		}
		
		public function set outcomeQueue(value:Vector.<ServerDataVO>):void
		{
			_outcomeQueue = value;
		}
		
		public function get gameName():String
		{
			return _gameName;
		}
		
		public function set gameName(value:String):void
		{
			_gameName = value;
			_serverProtocol.gameName = _gameName;
		}
		//--------------------------------------------------------------------------
		//
		//  Logs
		//
		//--------------------------------------------------------------------------
			
	}
}