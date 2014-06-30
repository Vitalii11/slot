//BaseEngine

package com.sot.baseEngine.managers
{
	import com.sot.baseEngine.Facade;
	import com.sot.baseEngine.events.ApplicationEvents;
	import com.sot.baseEngine.events.GlobalDispatcher;
	import com.sot.baseEngine.model.ModelEventConstants;
	import com.sot.baseEngine.superClasses.BaseClass;
	import com.sot.baseEngine.valueObjects.ConfigurationVO;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.media.Sound;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.system.Security;
	import flash.system.SecurityDomain;
	import flash.utils.getDefinitionByName;
	
	/**
	*
	*@author Artem.Fedorov
	*/
	
	public class FileManager extends BaseClass
	{
		//Constants
		
		
		//Privates
		private var _loadedFiles:Array = [];
		private var _currentIndex:int;	
		
		private static var _xml:XML;
		
		private static var _filesToLoad:Array = [];
		private static var _loadedFilesLoaderInfo:Array = [];
		
		private static var _settingsLoader:URLLoader;		
		static private var _loadedFilesCount:int;
		static private var _startLoadedFiles:int;
		static private var _totalFilesSize:int;

		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------

		public static function addFilesToLoad($filesToLoad:Array):void
		{
			if(_filesToLoad.length == 0) 
			{
				_filesToLoad = $filesToLoad;
				loadFiles($filesToLoad);
			} else {
				_filesToLoad.concat($filesToLoad);
				loadFiles($filesToLoad);
			}
		}
		
		
		private static function loadFiles($filesToLoad:Array, $callBack:Function = null):void
		{
			/*for (var i:int = 0; i < $filesToLoad.length; i++)
			{
				var cont:LoaderContext = new LoaderContext();
				cont.checkPolicyFile = true;
				cont.securityDomain = 	 SecurityDomain.currentDomain;
				cont.applicationDomain = ApplicationDomain.currentDomain;
				
				var request:URLRequest = new URLRequest($filesToLoad[i]);
				var loader:Loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadCompleteHandler);
				loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,  onLoadErrorHandler);
				loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,  onLoadProgressHandler);
				loader.contentLoaderInfo.addEventListener(Event.INIT,  onLoadOpenHandler);
				if(Security.sandboxType == Security.REMOTE)
				{
					loader.load(request,cont);
				}
				else
				{
					loader.load(request);	
				}
			}*/
			var request:URLRequest = new URLRequest(_filesToLoad[0]); 
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadCompleteHandler);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,  onLoadErrorHandler);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,  onLoadProgressHandler);
			loader.load(request); 
		}
		
		public static function onLoadOpenHandler(event:Event):void 
		{
			trace("Началась загрузка файла", event.target.url);
			
			_startLoadedFiles++;
			_totalFilesSize += event.target.bytesTotal;
			//if (_startLoadedFiles == _filesToLoad.length)
			//	GlobalDispatcher.dispatch(new ApplicationEvents(ModelEventConstants.FILE_LOAD_START, _totalFilesSize));
		}
		
		public static function init():void
		{
			_settingsLoader = new URLLoader();
			_settingsLoader.addEventListener(IOErrorEvent.IO_ERROR, onSettingsErrorHandler);
			_settingsLoader.addEventListener(Event.COMPLETE, onSettingsCmpleteHandler);
			
			trace (" setting url = ",Facade.settingsURL);
			if (Facade.settingsURL == null)
			{
				_settingsLoader.load(new URLRequest(Facade.serverData.gameURL + "settings.xml"));
			}
			else
			{
				_settingsLoader.load(new URLRequest(Facade.settingsURL));
			}
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Events handlers
		//
		//--------------------------------------------------------------------------
		/**
		 * Получение URL-адресов ассетов графики, управления view и шаблона игры.
		 * Изменяется модель - config. 
		 * @param event
		 * 
		 */		
		protected static function onSettingsCmpleteHandler(event:Event):void
		{
			var config:ConfigurationVO = new ConfigurationVO();
			_xml = new XML(_settingsLoader.data);
			Facade.baseEngineModel.parseConfig(_xml);
		}
		
		protected static function onSettingsErrorHandler(event:IOErrorEvent):void
		{
			trace("Ошибка загрузки файла настроек", event.text);
		}
		
		protected static function onLoadProgressHandler(event:ProgressEvent):void
		{
			//trace(event.bytesTotal, "/", event.bytesLoaded);
			GlobalDispatcher.dispatch(new ApplicationEvents(ModelEventConstants.FILE_PROGRESS, event));
		}
		
		protected static function onLoadErrorHandler(event:IOErrorEvent):void
		{
			// TODO Auto-generated method stub
			trace("Ошибка загрузки файла", event.text);
			event.target.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onLoadErrorHandler);
			_filesToLoad.shift();
			
		}		
		
		/**
		 * Все файлы загружены.
		 * @param event
		 * 
		 */		
		protected static function onLoadCompleteHandler(event:Event):void
		{
			trace("Файл", event.target.url, "загружен");
			_loadedFilesLoaderInfo.push(event.target);
			
			_loadedFilesCount++;
			
			_filesToLoad.shift();
			if (_filesToLoad.length > 0)
			{
				loadFiles(_filesToLoad);
				GlobalDispatcher.dispatch(new ApplicationEvents(ModelEventConstants.FILE_LOADED));
			} else {
				GlobalDispatcher.dispatch(new ApplicationEvents(ModelEventConstants.ALL_FILES_LOADED));
			}
			
			/*GlobalDispatcher.dispatch(new ApplicationEvents(ModelEventConstants.FILE_LOADED));
			
			if (_loadedFilesCount == _filesToLoad.length)
			{
				_filesToLoad = [];
				_startLoadedFiles = 0;
				_loadedFilesCount = 0;
				_totalFilesSize = 0;
				GlobalDispatcher.dispatch(new ApplicationEvents(ModelEventConstants.ALL_FILES_LOADED));
			}*/
			
			event.target.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoadCompleteHandler);
		}
		
		
		protected static function onOpenHandler(event:Event):void
		{
			// TODO Auto-generated method stub	
		}
		
		/**
		 * Получение класса по имени
		 * @param	$className имя класса
		 * @return полученый класс
		 */
		public static function getClassByName($className:String):Class
		{
			for each(var loaderInfo:LoaderInfo in _loadedFilesLoaderInfo)
			{
				if (loaderInfo.applicationDomain.hasDefinition($className))
					return loaderInfo.applicationDomain.getDefinition($className) as Class;
			}
			
			return null;
		}
		
		/**
		 * Получение мувиклипа по имени
		 * @param	$movieClipName имя мувиклипа
		 * @return полученый мувиклип
		 */
		public static function getMovieClipByName($movieClipName:String):MovieClip
		{
			if (getClassByName($movieClipName))
				return new(getClassByName($movieClipName)) as MovieClip;
			
			//trace("Не найден мувиклип", $movieClipName);
			return null;
		}
		
		public static function getSoundByName($soundName:String):Sound
		{
			if (getClassByName($soundName))
				return new(getClassByName($soundName)) as Sound;
			
			//trace("Не найден звук", $soundName);
			return null;
		}
		
		
		/**
		 * Получение, соответствующего шаблону, графического элемента.
		 * @param $patternName
		 * @return 
		 * 
		 */		
		public static function findGraphicName($patternName:String):String
		{
			var graphicName:String = _xml.graphicSwapNames.name.(@patternName == $patternName).@graphicName;
			return (graphicName == "") ? $patternName : graphicName;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getters&setters
		//
		//--------------------------------------------------------------------------
		static public function get loadedFilesLoaderInfo():Array 
		{
			return _loadedFilesLoaderInfo;
		}
		//--------------------------------------------------------------------------
		//
		//  Logs
		//
		//--------------------------------------------------------------------------
	}
}