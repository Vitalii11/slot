package com.sot.baseEngine.GameCheatMenu.panels 
{
	import com.sot.baseEngine.GameCheatMenu.CheatMenueConfig;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * Панель с элементами
	 * @author rocket
	 */
	public class ItemsPanel extends Sprite
	{
		public static const TYPE_HORIZONTAL		:int = 1;
		public static const TYPE_VERTICAL		:int = 2;
		
		public static const DIRECTION_LEFT		:int = 1;
		public static const DIRECTION_RIGHT		:int = 2;
		public static const DIRECTION_UP		:int = 3;
		public static const DIRECTION_DOWN		:int = 4;
		
		private var _items:Array;
		private var _type:int;
		private var _direction:int;
		private var _indentation:int;
		private var _itemsLayer:Sprite;
		private var _revers:Boolean = false;
		private var _name:String;
		private var _isOpen:Boolean = false;
		private var _panelOpener:DisplayObjectContainer;
		
		/**
		 * Панель с элементами
		 * @param	$name имя панели
		 * @param	$items массив элементов панели
		 * @param	$type тип танели (вертикальная/горизонральная)
		 * @param	$direction направление относительно родителя 
		 * @param	$indentation отступ между элементами
		 */
		public function ItemsPanel($name:String, $items:Array, $type:int, $direction:int, $indentation:int = 1) 
		{
			_name = $name;
			_items = $items;
			_type = $type;
			_direction = $direction;
			_indentation = $indentation;
			
			drawItemsLayer();
			
			if(_items != null) drawItems();
			//drawBg();
		}
		
		/**
		 * Отрисовка фона
		 */
		private function drawBg():void 
		{
			graphics.beginFill(0xFF0000, 0);
			graphics.drawRoundRect(0, 0, fixedWidth, fixedHeight, 5);
			graphics.endFill();
		}
		
		/**
		 * Создание слоя для элементов
		 */
		private function drawItemsLayer():void
		{
			_itemsLayer = new Sprite();
			addChild(_itemsLayer);
		}
		
		/**
		 * Добавление элементов в зависимости от направления
		 */
		private function drawItems():void
		{
			while (_itemsLayer.numChildren > 0)
				_itemsLayer.removeChildAt(0);
			
			if (_items)
			{
				if (_revers)
					_items.reverse();
					
				for (var i:int = 0; i < _items.length; i++)
				{
					switch (_type) 
					{
						case TYPE_HORIZONTAL:
							_items[i].x = i * (_items[i].fixedWidth + _indentation);
						break;
						case TYPE_VERTICAL:
							_items[i].y = i * (_items[i].fixedHeight + _indentation);
						break;
					}
					_itemsLayer.addChild(_items[i]);
				}
			}
		}
		
		/**
		 * Добавление на сцену относительно родителя и в зависимости от напривления
		 * @param	$parent элемент к которой нужно добавить панель
		 */
		public function setPosition($parent:*):void 
		{
			_panelOpener = $parent;
			switch (_direction) 
			{
				case DIRECTION_LEFT:
					x = $parent.x - fixedWidth - _indentation;
					y = ($parent.fixedHeight - fixedHeight) / 2;
				break;
				case DIRECTION_RIGHT:
					x = $parent.x + $parent.fixedWidth + _indentation;
					y = ($parent.fixedHeight - fixedHeight) / 2;
				break;
				case DIRECTION_UP:
					x = ($parent.fixedWidth - fixedWidth) / 2;
					y = $parent.y - fixedHeight - _indentation;
				break;
				case DIRECTION_DOWN:
					x = ($parent.fixedWidth - fixedWidth) / 2;
					y = $parent.y + $parent.fixedHeight + _indentation;
				break;
			}
		}
		
		/**
		 * Открытие панели
		 */
		public function open():void
		{
			if (!parent && parent != _panelOpener)
			{
				_panelOpener.addChild(this);
				_isOpen = true;
			}
		}
		
		/**
		 * акрытие панели
		 */
		public function close():void
		{
			if (parent) 
			{
				parent.removeChild(this);
				_isOpen = false;
			}
		}
		
		/**
		 * Отрисовка элементов в обратном порядке
		 */
		public function get revers():Boolean { return _revers; }
		public function set revers(value:Boolean):void 
		{
			_revers = value;
			drawItems();
		}
		
		/**
		 * Получить/задать элементы панели
		 */
		public function get items():Array { return _items; }
		public function set items(value:Array):void 
		{
			_items = value;
			drawItems();
		}
		
		/**
		 * Получение имени панели
		 */
		public function get panelName():String { return _name; }
		
		/**
		 * Получение состояния панели
		 */
		public function get isOpen():Boolean { return _isOpen; }
		
		public function get fixedWidth():int { return _type == TYPE_HORIZONTAL ? (CheatMenueConfig.ITEM_WINDT + _indentation) * _items.length - _indentation : CheatMenueConfig.ITEM_WINDT; }
		public function get fixedHeight():int { return _type == TYPE_VERTICAL ? (CheatMenueConfig.ITEM_HEIGHT + _indentation) * _items.length - _indentation : CheatMenueConfig.ITEM_HEIGHT; }
		
	}

}