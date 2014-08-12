package com.sot.game.buttons 
{
	import com.sot.game.helpers.Textures;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class BaseButton extends Sprite
	{
		public static const TYPE_PLAY:String = 'play';
		public static const TYPE_REEL:String = 'reel';
		public static const TYPE_SYMPLE:String = 'symple';
		
		public static const DISABLED:int 	= 0;
		public static const NORMAL:int 		= 1;
		public static const ACTIVE:int 		= 2;
		
		private var _mode:int	= NORMAL;
		
		//private var _settings:Object;
		
		private var _textField:TextField;
		
		private var _icon:Bitmap;
		
		private var _bottomLayer:Sprite;
		private var _topLayer:Sprite;
		
		private var _style:TextFormat;
		
		public var _settings:Object			= {
			
			// Подложка
			width              : 150,		//Ширина
			height             : 42,		//Высота
			backing            : false,     //Тип сборки
			pading             : 20,        //Высота уголка графики
			
			// Текст
			fontSize           : 30,		//Размер шрифта
			textLeading        : -8,		//Вертикальное расстояние между словами	
			fontBorderSize     : 3,			//Размер обводки шрифта
			fontBorderGlow     : 2,			//Размер размытия шрифта
			caption            : 'Start',	//Текст кнопки
			fontFamily         : "font",	//Шрифт
			textAlign          : "left",	//Расположение текста
			multiline          : false		//Многострочный текст
		}
		
		public function BaseButton(iconName:String, settings:Object) 
		{
			for (var key:* in settings) {
				_settings[key] = settings[key];
			}
			//_settings = settings;
			
			if (settings.backing) {
				_icon = Textures.backing(settings.width, settings.height, settings.pading, iconName);
			}else {
				_icon = new Bitmap(Textures.getByName(iconName));
			}
			
			addLayers();
			
			setEvents();
			
			drawText();
			drawBg();
			
			mouseChildren = false;
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
		 * отрисовываем текст
		 */
		private function drawText():void 
		{
			_textField = new TextField();
			
			_textField.mouseEnabled = false;
			_textField.mouseWheelEnabled = false;
			
			_textField.antiAliasType = AntiAliasType.ADVANCED;
			_textField.multiline = settings.multiline;
			_textField.embedFonts = true;
			_textField.sharpness = 100;
			_textField.thickness = 50;
			
			_textField.text = settings.caption;
			
			_style = new TextFormat(); 
			_style.color = settings.fontColor; 
			if(settings.multiline){
				_style.leading = settings.textLeading; 
			}
			_style.size = settings.fontSize;
			_style.font = settings.fontFamily;
			switch(settings.textAlign) {
				case "left": _style.align = TextFormatAlign.LEFT; break;
				case "center": _style.align = TextFormatAlign.CENTER; break;
				case "rigth": _style.align = TextFormatAlign.RIGHT; break;
			}			
			_textField.setTextFormat(_style);
			
			var textFilter:GlowFilter = new GlowFilter(settings.fontBorderColor, 1, settings.fontBorderSize, settings.fontBorderSize, 10, 1);
			var shadowFilter:DropShadowFilter = new DropShadowFilter(1,90,settings.fontBorderColor,0.9,2,2,2,1);
			_textField.filters = [textFilter, shadowFilter];	
			
			_textField.width = _textField.textWidth + 8;
			_textField.height = _textField.textHeight + 4;//settings.height;
			_textField.y = (_icon.height - _textField.textHeight) / 2 - 2;
			_textField.x = (_icon.width - _textField.width) / 2;
			
			_topLayer.addChild(_textField);
		}
		
		private function drawBg():void 
		{
			_bottomLayer.addChild(_icon);
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
		
		protected function MouseOver(e:MouseEvent):void 
		{
			
		}
		
		protected function MouseOut(e:MouseEvent):void 
		{
			
		}
		
		protected function MouseDown(e:MouseEvent):void 
		{
			
		}
		
		protected function MouseUp(e:MouseEvent):void 
		{
			
		}
		
		protected function onClick(e:MouseEvent):void 
		{
			if (_settings.onClick)
				_settings.onClick(e);
		}
		
		public function dispose():void
		{
			removeEventListener(MouseEvent.MOUSE_OVER, MouseOver);
			removeEventListener(MouseEvent.MOUSE_OUT, MouseOut);
			removeEventListener(MouseEvent.MOUSE_DOWN, MouseDown);
			removeEventListener(MouseEvent.MOUSE_UP, MouseUp);
			removeEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function disable():void 
		{
			
		}
		
		private function enable():void 
		{
			
		}
		
		private function active():void 
		{
			
		}
		
		public function set state(mode:int):void {
			
			_mode = mode;
			
			switch(mode) {
				case BaseButton.DISABLED:  disable(); break;
				case BaseButton.NORMAL:    enable(); break;
				case BaseButton.ACTIVE:    active(); break;
			}
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
		
		public function get mode():int 
		{
			return _mode;
		}
		
		public function set mode(value:int):void 
		{
			_mode = value;
		}
		
	}

}