//BaseEngine

package com.sot.baseEngine.controllers
{
	import com.sot.baseEngine.events.GlobalDispatcher;
	import com.sot.baseEngine.Facade;
	import flash.filters.GlowFilter;
	//import com.sot.baseEngine.GameCheatMenu.CheatMenu;
	import com.sot.baseEngine.managers.FileManager;
	import com.sot.baseEngine.model.ModelEventConstants;
	import com.sot.baseEngine.superClasses.BaseClass;
	import flash.events.Event;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	
	/*
	*
	*@author Artem.Fedorov
	*/
	
	public class GraphicsController extends BaseClass
	{
		
		private var _skin:MovieClip;
		
		public function GraphicsController()
		{
			super();
		}
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------

		/**
		 * Рекурсивная функция парсинга шаблона и построения графики согласно шаблону
		 * @param $pattern
		 * @param graphicAsset
		 * 
		 */		
		
		public function buildGraphicsByPattern($pattern:MovieClip):void
		{
			if (!$pattern) return;
			
			for (var i:uint = 0; i < $pattern.numChildren; i++)
			{					
				if($pattern.getChildAt(i) is MovieClip) 
				{					
					/*($pattern.getChildAt(i) as MovieClip).mouseEnabled = true;
					($pattern.getChildAt(i) as MovieClip).alpha = 1;
					($pattern.getChildAt(i) as MovieClip).visible = true;
					($pattern.getChildAt(i) as MovieClip).mask = null;
					($pattern.getChildAt(i) as MovieClip).filters = [new GlowFilter()];*/
					
					buildGraphicsByPattern($pattern.getChildAt(i) as MovieClip);
					addOriginalItemIntoPattern($pattern.getChildAt(i) as MovieClip);
				}
			}
		}
		
		/**
		 *Функция добавления оригинальной графики в контейнер шаблона
		 * @param $item
		 * 
		 */		
		private function addOriginalItemIntoPattern($item:MovieClip):void
		{
			
			
			var originalItem:DisplayObjectContainer = FileManager.getMovieClipByName(FileManager.findGraphicName($item.name));
			$item.gotoAndStop(1);
			
			if (!originalItem) return;
			
			(originalItem as MovieClip).gotoAndStop(1);
			originalItem.x = $item.x;
			originalItem.y = $item.y;
			originalItem.alpha = $item.alpha;
			
			originalItem.rotation = $item.rotation;
			var index:uint = $item.parent.getChildIndex($item);
			var itemName:String = $item.name;
			var actualParent:DisplayObjectContainer = $item.parent;
			actualParent.removeChildAt(index);
			
			if($item.name == "doubleGameContainer_mc")
				trace("!!!", $item.name, $item.x, originalItem.width);
			
			$item = null;
			originalItem.name = itemName;
			actualParent.addChildAt(originalItem, index);
			//dictionaryHandling(originalItem);
		}
		
		/**
		 * Перевод TextField-ов кнопок согласно локализации
		 * @param $item
		 * 
		 */		
		private function dictionaryHandling($item:DisplayObjectContainer):void
		{
			for (var i:uint = 0; i < $item.numChildren; i++)
				if($item.getChildAt(i) is TextField) 
					($item.getChildAt(i) as TextField).text = Facade.dictionaryController.findTranslationName(($item.getChildAt(i) as TextField).name);
		}
		
		
		/**
		 *Регистрация компоненента 
		 * 
		 */		
		override protected function onRegister():void
		{
			Facade.buttonsController = new ButtonsController();
			var pattern:MovieClip = FileManager.getMovieClipByName("gamePattern_mc");
			if(!pattern) return;
			buildGraphicsByPattern(pattern);
			skin = pattern;
			Facade.myStage.addChild(pattern);
			if (!Facade.mobileMode)
			{
				skin.addEventListener(MouseEvent.CLICK, onMouseClickHandler);
				skin.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverHandler);
				skin.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownHandler);
				skin.parent.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler);
				skin.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutHandler);
			}
			else 
			{
				skin.addEventListener(MouseEvent.CLICK, onMouseClickHandler);
				skin.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverHandler);
				skin.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownHandler);
				skin.parent.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler);
				skin.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutHandler);
			}
			GlobalDispatcher.addListener(ModelEventConstants.DISPOSE_ALL, onDisposeAllHandler);
 			if (skin.doubleGameContainer_mc) skin.doubleGameContainer_mc.y = -1000;
			//addCheatMenu();
		}
		
	/*	private function addCheatMenu():void 
		{
			var cheatMenu:CheatMenu = new CheatMenu(skin);
			cheatMenu.x = 110;
			cheatMenu.y = 30;
			skin.addChild(cheatMenu);
		}*/
		
		//--------------------------------------------------------------------------
		//
		//  Events handlers
		//
		//--------------------------------------------------------------------------
		private function onDisposeAllHandler(e:Event):void 
		{
			skin.parent.removeChild(skin);
			skin = null;
		}
		
		protected function onMouseOverHandler(event:MouseEvent):void
		{
			//for override
		}
		
		protected function onMouseClickHandler(event:MouseEvent):void
		{
			//for override
		}
		
		
		protected function onMouseOutHandler(event:MouseEvent):void
		{
			//for override
		}
		
		protected function onMouseUpHandler(event:MouseEvent):void
		{
			//for override
		}
		
		protected function onMouseDownHandler(event:MouseEvent):void
		{
			//for override
		}
		//--------------------------------------------------------------------------
		//
		//  Getters&setters
		//
		//--------------------------------------------------------------------------
		public function get skin():MovieClip
		{
			return _skin;
		}
		
		public function set skin(value:MovieClip):void
		{
			_skin = value;
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Logs
		//
		//--------------------------------------------------------------------------
	}
}