package com.sot.baseEngine.controllers 
{
	import com.sot.baseEngine.customClasses.ButtonsState;
	import com.sot.baseEngine.customClasses.ButtonsWrapper;
	import flash.display.MovieClip;
	import flash.utils.Dictionary;
	/**
	 * Класс, необходимый для отображения и управления кнопок созданных из movie_clip
	 * @author Jack Klimov
	 */
	public class ButtonsController 
	{
		/** список всех кнопок с группами */
		private var allButtons:Object = new Object();
		/** список всех кастомных состояний */
		private var allCustomStates:Dictionary = new Dictionary();
		
		//		      BASIC	STATES
		// ------------------------------
		private var _stateEnabled:ButtonsState =  new ButtonsState("enable");
		private var _stateDisabled:ButtonsState = new ButtonsState("disable"); 
		private var _stateHighlighted:ButtonsState = new ButtonsState("active"); 
		private var _stateClicked:ButtonsState = new ButtonsState("clicked"); 
		
		
		public function ButtonsController() 
		{
			trace("ButtonsControllerInitiated");
		}
		/**
		 * Соббрать новую кнопку из мувиклипа
		 * @param	$mc Мувиклип для кнопки
		 * @param	$group Группа || например: ["интерфейс","дополнительно"]
		 * @param	$state состояние кнопки из констант класса ButtonsWrapper
		 * @param	$callBack функция, вызываемая при клике
		 * @return  возвращает кнопку 
		 */
		public function addButton($mc:MovieClip, $group:Array = null, $state:ButtonsState = null, $callBack:Function = null):ButtonsWrapper 
		{
			var newButton:ButtonsWrapper = new ButtonsWrapper($mc, $group, $state, $callBack, this);
			//$mc.mouseChildren = true;
			//$mc.mouseEnabled = true;
			if ($group == null)
			{
				addButtonToGroup(newButton, GROUP_UNCATEGORIZED);
			}
			else
			{
				for (var i:uint = 0; i < $group.length; i++)
				{
					addButtonToGroup(newButton, $group[i]);
				}
			}
			
			return newButton;
		}
		
		public function changeBasicStates($enableState:ButtonsState = null, $disableState:ButtonsState = null, $highlightState:ButtonsState = null, $clickState:ButtonsState = null):void
		{
			if ($enableState != null) stateEnabled = $enableState;
			if ($disableState != null) stateDisabled = $disableState;
			if ($highlightState != null) stateHighlighted = $highlightState;
			if ($clickState != null) stateClicked = $clickState;
			
			if (allButtons == null) return;
			
			var btnsObj:Object = allButtons;
			for (var group:String in btnsObj)
			{
				var btnGroupObj:Object = btnsObj[group];
				for (var btnName:String in btnGroupObj)
				{
					(btnGroupObj[btnName] as ButtonsWrapper).updateBasicStatesFromController();					
				}
			}
		}
		
		/**
		 * добавить кнопку в группу 
		 * @param	$btn Кнопка
		 * @param	$group Группа
		 */
		public function addButtonToGroup($btn:ButtonsWrapper, $group:String):void 
		{
			if (allButtons[$group] == null) allButtons[$group] = new Object();
			allButtons[$group][$btn.btnName] = $btn;
		}
		
		/**
		 * получить все кнопки в группе
		 * @param	$group Группа
		 */
		public function getButtons($group:String):Vector.<ButtonsWrapper> 
		{
			var btnsObj:Object = allButtons[$group];
			var btns:Vector.<ButtonsWrapper> = new Vector.<ButtonsWrapper>;
			for (var name:String in btnsObj)
			{
				btns.push(btnsObj[name]);
			}
			return btns;
		}
		
		/**
		 * получить все кнопки в группе
		 * @param	$group Группа
		 */
		public function getButtonByName($name:String):ButtonsWrapper 
		{
			
			var btn:ButtonsWrapper;
			for (var name:String in allButtons)
			{
				var btnsGroup:Object = allButtons[name];
				for (var buttonName:String in btnsGroup)
				{
					if (buttonName == $name) 
					{
						btn = btnsGroup[$name];
						return btn;					
					}
				}
			}
			return btn;
		}
		
		/**
		 * Выставить состояние всем кнопкам в группе
		 * @param	$group группа
		 * @param	$state состояние
		 */
		public function setButtonsState($group:String, $state:ButtonsState):void 
		{			
			var btns:Vector.<ButtonsWrapper> = getButtons($group);
			for (var i:uint = 0; i < btns.length; i++)
			{
				btns[i].btnState = $state;
			}
		}
		
		
		//		      CONSTANTS
		// ------------------------------
		public const GROUP_UNCATEGORIZED:String = "group_uncategorized";
		
		
		//		      GETTERS AND SETTERS
		// ------------------------------
		/** состояние кнопки обычное включенное */
		public function get stateEnabled():ButtonsState 
		{
			return _stateEnabled;
		}
		/** состояние кнопки обычное включенное */
		public function set stateEnabled(value:ButtonsState):void 
		{
			_stateEnabled = value;
		}
		/** состояние кнопки деактивированное */
		public function get stateDisabled():ButtonsState 
		{
			return _stateDisabled;
		}
		/** состояние кнопки деактивированное */
		public function set stateDisabled(value:ButtonsState):void 
		{
			_stateDisabled = value;
		}
		/** состояние кнопки при наведении */
		public function get stateHighlighted():ButtonsState 
		{
			return _stateHighlighted;
		}
		/** состояние кнопки при наведении */
		public function set stateHighlighted(value:ButtonsState):void 
		{
			_stateHighlighted = value;
		}
		/** состояние кнопки при нажатии */
		public function get stateClicked():ButtonsState 
		{
			return _stateClicked;
		}
		/** состояние кнопки при нажатии */
		public function set stateClicked(value:ButtonsState):void 
		{
			_stateClicked = value;
		}
		
		
	}

}