package com.sot.game.buttons 
{
	import com.sot.game.helpers.Textures;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class BaseButton extends Sprite
	{
		private var _settings:Object;
		
		private var _textField:TextField;
		
		private var _icon:Bitmap;
		
		private var _bottomLayer:Sprite;
		private var _topLayer:Sprite;
		
		public function BaseButton(icon:Class, settings:Object) 
		{
			_settings = settings;
			
			if (settings.backing) {
				_icon = Textures.backing(settings.width, settings.height, settings.pading, icon);
			}else {
				_icon = new icon();
			}
			
			addLayers();
			
			setEvents();
		}
		
		/**
		 * добавляем текст кнопки
		 */
		private function addLayers():void 
		{
			_bottomLayer = new Sprite();
			_topLayer = new Sprite();
			
			addChild(_bottomLayer);
			addChild(_topLayer);
		}
		
		/**
		 * назначаем слушатели событий
		 */
		private function setEvents():void {
			addEventListener(MouseEvent.MOUSE_OVER, MouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, MouseOut);
			addEventListener(MouseEvent.MOUSE_DOWN, MouseDown);
			addEventListener(MouseEvent.MOUSE_UP, MouseUp);
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function MouseOver(e:MouseEvent):void 
		{
			
		}
		
		private function MouseOut(e:MouseEvent):void 
		{
			
		}
		
		private function MouseDown(e:MouseEvent):void 
		{
			
		}
		
		private function MouseUp(e:MouseEvent):void 
		{
			
		}
		
		private function onClick(e:MouseEvent):void 
		{
			
		}
		
		/**
		 * установить текст кнопки
		 */
		public function set caption(txt:String):void
		{
			_textField.text = txt;
		}
		
		public function get settings():Object 
		{
			return _settings;
		}
		
		public function get icon():Bitmap 
		{
			return _icon;
		}
		
		public function get bottomLayer():Sprite 
		{
			return _bottomLayer;
		}
		
		public function get topLayer():Sprite 
		{
			return _topLayer;
		}
		
	}

}