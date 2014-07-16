package com.sot.baseEngine.customClasses 
{
	import com.sot.baseEngine.controllers.ButtonsController;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * Класс для работы с кнопками
	 * @author Jack Klimov
	 */
	public class ButtonsWrapper 
	{
		/** скин для кнопки */
		public var btnSkin:MovieClip;
		/** функция, вызываемая при клике на кнопку */
		public var clickCallback:Function;
		/** функция, вызываемая при клике на кнопку */
		public var overCallback:Function;
		/** функция, вызываемая при клике на кнопку */
		public var outCallback:Function;
		/** функция, вызываемая при клике на кнопку */
		public var mouseDownCallback:Function;
		/** состояние кнопки */
		private var _btnState:ButtonsState;		
		/** состояние кнопки */
		public var btnName:String;
		/** активная кнопка? */
		private var _btnEnable:Boolean;
		/** ссылка на контроллер */
		private var _linktoButtonController:ButtonsController;
		
		/** список функций для переключения состояний кастомных  */
		private var customStateFunctions:Vector.<Function> = new Vector.<Function>;
		/** список событий для переключения состояний кастомных  */
		private var customStateConditions:Vector.<String> = new Vector.<String>;
		
		/**
		 * Создание экземпляра button's wrapper
		 * @param	$mc скин кнопки
		 * @param	$group группа кнопки (или несколько) 
		 * @param	$callBack функция, вызываемая при клике
		 */
		public function ButtonsWrapper($mc:MovieClip, $group:Array = null, $state:ButtonsState = null, $callBack:Function = null, $linkToButtonsController:ButtonsController = null) 
		{
			btnSkin = $mc;
			trace("name => " + $mc.name);
			clickCallback = $callBack;
			btnName = $mc.name;
			btnEnable = true;
			btnSkin.stop();
			
			_linktoButtonController = $linkToButtonsController;
			//setUpAllStatesFromButtonsController(_linktoButtonController);
			
			btnSkin.mouseChildren = false;
			
			if ($state) btnState = $state;
			else btnState = STATE_ENABLED;
			
			onRegister();			
		}
		
		private function setUpAllStatesFromButtonsController($linkToButtonsController:ButtonsController):void 
		{			
			STATE_ENABLED =  $linkToButtonsController.stateEnabled;
			STATE_DISABLED = $linkToButtonsController.stateDisabled;
			STATE_HIGHLIGHTED = $linkToButtonsController.stateHighlighted;
			STATE_CLICKED = $linkToButtonsController.stateClicked;	
		}
		
		public function updateBasicStatesFromController():void 
		{			
			STATE_ENABLED =  _linktoButtonController.stateEnabled;
			STATE_DISABLED = _linktoButtonController.stateDisabled;
			STATE_HIGHLIGHTED = _linktoButtonController.stateHighlighted;
			STATE_CLICKED = _linktoButtonController.stateClicked;	
		}
		
		/** регистрируем слушатели событий */
		protected function onRegister():void 
		{
			btnSkin.addEventListener(MouseEvent.ROLL_OVER, onBtnRollOver);
			btnSkin.addEventListener(MouseEvent.ROLL_OUT, onBtnRollOut);
			btnSkin.addEventListener(MouseEvent.MOUSE_DOWN, onBtnDown);
			btnSkin.addEventListener(MouseEvent.MOUSE_UP, onBtnUp);
			btnSkin.addEventListener(MouseEvent.CLICK, onBtnClick);
			btnSkin.addEventListener(MouseEvent.MOUSE_MOVE, onBtnMove);
		}
		
		private function onBtnMove(e:MouseEvent):void 
		{
			//trace("btnName => [", btnName, "] btnState => [", btnState.frameLabel, "] Btn enabled -", btnEnable);
		}
		
		private function onBtnUp(e:MouseEvent):void 
		{
			if (btnEnable) btnState = STATE_ENABLED;
		}
		
		private function onBtnClick(e:MouseEvent = null):void 
		{
			if (clickCallback != null && btnEnable) clickCallback(e);
		}
		
		protected function onBtnDown(e:MouseEvent):void 
		{
			if (btnEnable) btnState = STATE_CLICKED;
			if (mouseDownCallback != null) mouseDownCallback();
		}
		
		protected function onBtnRollOut(e:MouseEvent):void 
		{
			if (btnEnable) btnState = STATE_ENABLED;
			if (outCallback != null) outCallback();
			
		}
		
		protected function onBtnRollOver(e:MouseEvent):void 
		{
			if (btnEnable) btnState = STATE_HIGHLIGHTED;
			if (overCallback != null) overCallback();
			//if (btnName != "makewindow_btn" && btnName != "sound_btn") trace("btnName => [", btnName, "] btnState => [", btnState.frameLabel, "] Btn enabled -", btnEnable);
		}
		
		/**
		 * Новое состояние для кнопки
		 * @param	$state
		 */
		public function newCustomState($state:ButtonsState):void 
		{
			this.btnEnable = $state.btnEnable;
			
			if ($state.conditionEvent)
			{
				var conditionStateFunction:Function = function(e:Object):void {
					btnSkin.gotoAndStop($state.frameLabel);
					e.stopImmediatePropagation();	
					//trace(e.type);
				}
				customStateFunctions.push(conditionStateFunction);
				customStateConditions.push($state.conditionEvent);
				btnSkin.addEventListener($state.conditionEvent, conditionStateFunction, false, 100, true);
			}
			else
			{
				btnSkin.gotoAndStop($state.frameLabel);
			}
			if ($state.clickCallback != null)
			{
				customStateFunctions.push($state.clickCallback);
				customStateConditions.push(MouseEvent.CLICK);
				btnSkin.addEventListener(MouseEvent.CLICK, $state.clickCallback, false, 100, true);
			}
			
			if ($state.outCallback != null)
			{
				customStateFunctions.push($state.outCallback);
				customStateConditions.push(MouseEvent.ROLL_OUT);
				btnSkin.addEventListener(MouseEvent.ROLL_OUT, $state.outCallback, false, 100, true);
			}
			
			if ($state.overCallback != null)
			{
				customStateFunctions.push($state.overCallback);
				customStateConditions.push(MouseEvent.ROLL_OVER);
				btnSkin.addEventListener(MouseEvent.ROLL_OVER, $state.overCallback, false, 100, true);
			}
		}
		
		//		      CONSTANTS
		// ------------------------------
		public static var STATE_ENABLED:ButtonsState =  new ButtonsState("enable");
		public static var STATE_DISABLED:ButtonsState = new ButtonsState("disable"); 
		public static var STATE_HIGHLIGHTED:ButtonsState = new ButtonsState("active"); 
		public static var STATE_CLICKED:ButtonsState = new ButtonsState("clicked"); 
		
		
		//       GETTERS && SETTERS
		// ------------------------------
		
		/** кнопка активна? */
		public function get btnEnable():Boolean 
		{
			return _btnEnable;
		}
		/** кнопка активна? */
		public function set btnEnable(value:Boolean):void 
		{
			if(!value)
			{
				btnSkin.enabled = false;
				btnSkin.mouseEnabled = false;
			}
			else
			{
				btnSkin.enabled = true;
				btnSkin.mouseEnabled = true;
			}			
			_btnEnable = value;
		}
		/** состояние кнопки */
		public function get btnState():ButtonsState 
		{
			return _btnState;
		}
		/** состояние кнопки */
		public function set btnState(value:ButtonsState):void 
		{			
			if (_btnState == value) return;
			
			var hasLabel:Boolean = false;
			for (var i:int = 0; i < btnSkin.currentLabels.length; i++)
			{
				if (btnSkin.currentLabels[i].name ==  value.frameLabel)
				{
					hasLabel = true;
					break;
				}
			}
			if (!hasLabel) return;
			//if (btnSkin.name == "start_btn" && value.frameLabel != "active") 
				//trace(" ");
			
			
			
			if (value != STATE_CLICKED && value != STATE_DISABLED  && value != STATE_ENABLED && value != STATE_HIGHLIGHTED)  
				newCustomState(value);
			
			switch(value) 
			{
				case STATE_ENABLED:
					btnSkin.gotoAndStop(STATE_ENABLED.frameLabel);
					btnEnable = true;
				break;
				case STATE_DISABLED:
					btnSkin.gotoAndStop(STATE_DISABLED.frameLabel);
					btnEnable = false;					
				break;
				case STATE_HIGHLIGHTED:
					btnSkin.gotoAndStop(STATE_HIGHLIGHTED.frameLabel);
				break;
				case STATE_CLICKED:
					btnSkin.gotoAndStop(STATE_CLICKED.frameLabel);
				break;
				default:
					btnSkin.gotoAndStop(value.frameLabel);
				break;
			}
			
			_btnState = value;
		}
	
		
		public function onDispose():void 
		{
			btnSkin.removeEventListener(MouseEvent.ROLL_OVER, onBtnRollOver);
			btnSkin.removeEventListener(MouseEvent.ROLL_OUT, onBtnRollOut);
			btnSkin.removeEventListener(MouseEvent.MOUSE_DOWN, onBtnDown);
			btnSkin.removeEventListener(MouseEvent.CLICK, onBtnClick);
			
			if (customStateConditions.length > 0)
			{
				for (var i:int = 0; i > customStateConditions.length; i++)
				{
					btnSkin.removeEventListener(customStateConditions[i], customStateFunctions[i]);
				}
				customStateConditions = null;
				customStateFunctions = null;
			}
		}
	}

}