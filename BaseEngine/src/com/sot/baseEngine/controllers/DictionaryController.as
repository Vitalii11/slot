//BaseEngine

package com.sot.baseEngine.controllers
{
	import com.sot.baseEngine.superClasses.BaseClass;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	
	/*
	*
	*@author Artem.Fedorov
	*/
	
	public class DictionaryController extends BaseClass
	{
		
		private var _dictionaryLoader:URLLoader;
		
		private var _xml:XML;
		
		
		public function DictionaryController()
		{ 
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		override protected function onRegister():void
		{
			loadDictionary();
		}
		
		/**
		 * Загрузка словаря 
		 * 
		 */		
		private function loadDictionary():void
		{
			_dictionaryLoader = new URLLoader();
			_dictionaryLoader.addEventListener(IOErrorEvent.IO_ERROR, onDictionaryErrorHandler);
			_dictionaryLoader.addEventListener(Event.COMPLETE, onDictionaryCmpleteHandler);
			_dictionaryLoader.load(new URLRequest("RussianDictionary.xml")); //TODO: в дальнейшем URL будет получен из FlashVars
		}
		
		
		/**
		 * Поиск соответствия перевода
		 * @param $patternName
		 * @return 
		 * 
		 */		
		public function findTranslationName($patternName:String):String
		{
			var translation:String = _xml.words.word.(@patternName == $patternName).@translation;
			return (translation == "") ? $patternName : translation;
		}
		//--------------------------------------------------------------------------
		//
		//  Events handlers
		//
		//--------------------------------------------------------------------------
		protected function onDictionaryCmpleteHandler(event:Event):void
		{
			_xml = new XML(_dictionaryLoader.data);
		}
		
		protected function onDictionaryErrorHandler(event:IOErrorEvent):void
		{
			// TODO Auto-generated method stub
			trace("Ошибка загрузки словаря", event.text);
		}
		//--------------------------------------------------------------------------
		//
		//  Getters&setters
		//
		//--------------------------------------------------------------------------
		//--------------------------------------------------------------------------
		//
		//  Logs
		//
		//--------------------------------------------------------------------------
	}
}