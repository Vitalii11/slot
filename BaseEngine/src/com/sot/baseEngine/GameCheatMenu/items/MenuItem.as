package com.sot.baseEngine.GameCheatMenu.items 
{
	import com.sot.baseEngine.GameCheatMenu.CheatMenueConfig;
	import com.sot.baseEngine.GameCheatMenu.CheatMenueConfig;
	import com.sot.baseEngine.GameCheatMenu.events.CheatEvents;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.display.Sprite;
	
	/**
	 * Элемент панели
	 * @author rocket
	 */
	public class MenuItem extends Sprite
	{
		private var _eventName:String;
		private var _imageName:String;
		private var _hintText:String;
		private var _eventParams:Object;
		private var _bg:Sprite;
		private var _itemTextField:TextField;
		
		/**
		 * Элемент панели
		 * @param	$eventName евент который будет диспатчится по клику
		 * @param	$hintText текст подсказки
		 * @param	$image имя картинки
		 */
		public function MenuItem($eventName:String, $eventParams:Object = null, $hintText:String = null, $imageName:String = null) 
		{
			_eventName = $eventName;
			_eventParams = $eventParams;
			_hintText = $hintText;
			_imageName = $imageName;
			
			drawBg();
			addText();
			addListeners();
			
			buttonMode = true;
			bg.mouseChildren = false;
		}
		
		/**
		 * Отрисовка фона
		 */
		protected function drawBg():void
		{
			_bg = new Sprite();
			_bg.graphics.beginFill(0x0, 1);
			_bg.graphics.drawRoundRect(0, 0, CheatMenueConfig.ITEM_WINDT, CheatMenueConfig.ITEM_HEIGHT, 5);
			_bg.graphics.endFill();
			addChild(_bg);
		}
		
		protected function addText():void 
		{
			_itemTextField = new TextField();
			_itemTextField.defaultTextFormat = new TextFormat("Tahoma", CheatMenueConfig.ITEM_TEXT_SIZE, 0xffffff);
			_itemTextField.text = _hintText;
			_itemTextField.multiline = false;
			_itemTextField.selectable = false;
			_itemTextField.autoSize = TextFieldAutoSize.CENTER;
			_itemTextField.x = (fixedWidth - _itemTextField.width) / 2;
			_itemTextField.y = fixedHeight - _itemTextField.height;
			_itemTextField.mouseEnabled = false;
			_bg.addChild(_itemTextField);
		}
		
		/**
		 * Добавление листенеров
		 */
		protected function addListeners():void
		{
			addEventListener(MouseEvent.CLICK, onMouseClick);
			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
		}
		
		protected function onMouseClick(e:MouseEvent):void
		{
			e.stopPropagation();
			if (_eventName != "") {
				trace("CheatMenu: dispatchEvent " + _eventName, _eventParams);
				dispatchEvent(new CheatEvents(_eventName, _eventParams, true));
			}
		}
		protected function onMouseDown(e:MouseEvent):void
		{
			
		}
		protected function onMouseUp(e:MouseEvent):void
		{
			
		}
		protected function onMouseOut(e:MouseEvent):void
		{
			
		}
		protected function onMouseOver(e:MouseEvent):void
		{
			
		}
		
		public function get itemText():String { return _itemTextField.text; }
		public function set itemText(value:String):void 
		{
			_itemTextField.text = value;
		}
		
		public function get itemTextField():TextField { return _itemTextField; }
		
		public function get fixedWidth():int { return CheatMenueConfig.ITEM_WINDT; }
		public function get fixedHeight():int { return CheatMenueConfig.ITEM_HEIGHT; }
		
		public function get bg():Sprite 
		{
			return _bg;
		}
		
		public function set bg(value:Sprite):void 
		{
			_bg = value;
		}
		
	}

}