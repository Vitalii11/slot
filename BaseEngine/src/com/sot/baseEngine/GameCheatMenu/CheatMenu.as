package com.sot.baseEngine.GameCheatMenu 
{
	import com.sot.baseEngine.GameCheatMenu.items.NewPanelItem;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.system.System;
	import flash.utils.Timer;
	import com.sot.baseEngine.GameCheatMenu.items.NewPanelItem;

	/**
	 * Читерская менюшка для облегчения разработки и тестирования
	 * @author rocket
	 */
	public class CheatMenu extends NewPanelItem
	{
		private var _timer:Timer;
		private var _currentFrames:int;
		private var _spriteCount:int;
		private var sss:Sprite;
		private var _drag:Boolean = false;
		
		/**
		 * Читерская менюшка для облегчения разработки и тестирования
		 */
		public function CheatMenu($parent:Sprite)
		{			
			new MenuXML(null);
			
			super("", null, "", "", "main");
			alpha = 0.8;
			
			sss = $parent;
			sss.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void { trace(e.target); } );
			
			initTimer();
			setText();
		}
		
		override protected function addListeners():void 
		{
			super.addListeners();
			addEventListener(Event.ENTER_FRAME, countFrame);
			if (CheatMenueConfig.USE_DRAG_MENU)
			{
				bg.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
				bg.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			}
		}
		
		private function onMouseMove(e:MouseEvent):void 
		{
			_drag = true;
		}
		
		override protected function onMouseDown(e:MouseEvent):void 
		{
			super.onMouseDown(e);
			bg.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			startDrag();
		}
		
		override protected function onMouseUp(e:MouseEvent):void 
		{
			super.onMouseUp(e);
			bg.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			stopDrag();
		}
		
		override protected function onMouseClick(e:MouseEvent):void 
		{
			if(!_drag)
				super.onMouseClick(e);
			else
				_drag = false;
		}
		
		/**
		 * Подсчет колличества кадров
		 * @param	e
		 */
		private function countFrame(e:Event):void 
		{
			_currentFrames++;
		}
		
		/**
		 * Содание и запуск таймера для обновления инфы о нагрузке
		 */
		private function initTimer():void
		{
			_timer = new Timer(1000);
			_timer.addEventListener(TimerEvent.TIMER, onTimer);
			_timer.start();
			itemTextField.y = 0;
		}
		
		/**
		 * Действия по срабатыванию таймера
		 * @param	e
		 */
		private function onTimer(e:TimerEvent):void 
		{
			setText();
			getSptiteCount(sss);
		}
		
		private function setText():void
		{
			itemText =  "Memory: " + getMemoryUsage().toString() + "\n" + 
						"Sprites: " + _spriteCount.toString() + "\n" + 
						"FPS: " + _currentFrames.toString();
			
			_currentFrames = 0;
			_spriteCount = 0;
		}
		
		/**
		 * Получить значение используемой памяти в мегабайтах
		 * @return
		 */
		private function getMemoryUsage():int 
		{
			return Math.round(((System.totalMemory / 1000) / 1000));
		}
		
		/**
		 * Отрисовка фона
		 */
		override protected function drawBg():void 
		{
			bg = new Sprite;
			bg.graphics.beginFill(0x123456, 1);
			bg.graphics.drawRoundRect(0, 0, CheatMenueConfig.HEADER_WINDT, CheatMenueConfig.HEADER_HEIGHT, 5);
			bg.graphics.endFill();
			addChild(bg);
		}
		
		private function getSptiteCount($parent:Sprite):void 
		{
			if ($parent)
			{
				for (var i:int = 0; i < $parent.numChildren; i++)
				{
					_spriteCount++;
					if ($parent.getChildAt(i) is Sprite)
					{
						getSptiteCount($parent.getChildAt(i) as Sprite);
					}
				}
			}
		}
		
		override public function get fixedWidth():int { return CheatMenueConfig.HEADER_WINDT; }
		override public function get fixedHeight():int { return CheatMenueConfig.HEADER_HEIGHT; }
	}

}