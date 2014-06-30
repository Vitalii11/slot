//BaseEngine

package com.sot.baseEngine.valueObjects
{
	
	/*
	*
	*@author Artem.Fedorov
	*/
	
	public class ConfigurationVO
	{
		private var _patternURL:String;
		private var _graphicsURL:String;
		private var _viewUrl:String;
		private var _soundsUrl:String;
		private var _interfaceURL:String;
		private var _UIComponentURL:String;
		private var _mainURL:String;
		private var _gameName:String;
		private var _UIComponent:String;
		private var _doubleGameComponent:String;
		
		private var _totalLines:uint;
		private var _lineName:String;
		private var _linesComponent:String;
		private var _reelsComponent:String;
		private var _reelName:String;
		private var _effects:XML;
		private var _protectionKey:String;
		private var _combinations:XML;
		private var _paytable:XML;
		
		private var _scatterSymbol:int;
		private var _wildSymbol:int;

		public function get protectionKey():String
		{
			return _protectionKey;
		}

		public function set protectionKey(value:String):void
		{
			_protectionKey = value;
		}

		public function get effects():XML
		{
			return _effects;
		}

		public function set effects(value:XML):void
		{
			_effects = value;
		}

		public function get reelName():String
		{
			return _reelName;
		}

		public function set reelName(value:String):void
		{
			_reelName = value;
		}

		public function get reelsComponent():String
		{
			return _reelsComponent;
		}

		public function set reelsComponent(value:String):void
		{
			_reelsComponent = value;
		}

		public function get linesComponent():String
		{
			return _linesComponent;
		}

		public function set linesComponent(value:String):void
		{
			_linesComponent = value;
		}

		public function get totalLines():uint
		{
			return _totalLines;
		}

		public function set totalLines(value:uint):void
		{
			_totalLines = value;
		}

		public function get lineName():String
		{
			return _lineName;
		}

		public function set lineName(value:String):void
		{
			_lineName = value;
		}

		public function get doubleGameComponent():String
		{
			return _doubleGameComponent;
		}

		public function set doubleGameComponent(value:String):void
		{
			_doubleGameComponent = value;
		}

		public function get UIComponent():String
		{
			return _UIComponent;
		}

		public function set UIComponent(value:String):void
		{
			_UIComponent = value;
		}

		public function get mainURL():String
		{
			return _mainURL;
		}

		public function set mainURL(value:String):void
		{
			_mainURL = value;
		}

		public function get patternURL():String
		{
			return _patternURL;
		}

		public function set patternURL(value:String):void
		{
			_patternURL = value;
		}

		public function get interfaceURL():String
		{
			return _interfaceURL;
		}

		public function set interfaceURL(value:String):void
		{
			_interfaceURL = value;
		}

		public function get viewUrl():String
		{
			return _viewUrl;
		}

		public function set viewUrl(value:String):void
		{
			_viewUrl = value;
		}

		public function get graphicsURL():String
		{
			return _graphicsURL;
		}

		public function set graphicsURL(value:String):void
		{
			_graphicsURL = value;
		}
		
		public function get soundsUrl():String 
		{
			return _soundsUrl;
		}
		
		public function set soundsUrl(value:String):void 
		{
			_soundsUrl = value;
		}
		
		public function get gameName():String 
		{
			return _gameName;
		}
		
		public function set gameName(value:String):void 
		{
			_gameName = value;
		}
		
		public function get combinations():XML 
		{
			return _combinations;
		}
		
		public function set combinations(value:XML):void 
		{
			_combinations = value;
		}
		
		public function get paytable():XML 
		{
			return _paytable;
		}
		
		public function set paytable(value:XML):void 
		{
			_paytable = value;
		}
		
		public function get UIComponentURL():String 
		{
			return _UIComponentURL;
		}
		
		public function set UIComponentURL(value:String):void 
		{
			_UIComponentURL = value;
		}
		
		public function get scatterSymbol():int 
		{
			return _scatterSymbol;
		}
		
		public function set scatterSymbol(value:int):void 
		{
			_scatterSymbol = value;
		}
		
		public function get wildSymbol():int 
		{
			return _wildSymbol;
		}
		
		public function set wildSymbol(value:int):void 
		{
			_wildSymbol = value;
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