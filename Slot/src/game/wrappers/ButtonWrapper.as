package game.wrappers 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class ButtonWrapper 
	{
		public static const STATE_ACTIVE:String = 'active';
		public static const STATE_OVER:String = 'over';
		public static const STATE_ENABLE:String = 'enable';
		public static const STATE_DISABLE:String = 'disable';
		
		
		public var _btnSkin:MovieClip;
		
		private var _settings:Object;
		
		private var _btnState:String;
		
		public function ButtonWrapper(btnSkin:MovieClip, settings:Object = null) 
		{
			_btnSkin = btnSkin;
			
			if (settings == null)
				_settings = { };
			else
				_settings = settings;
				
			if (_settings.state)
				_btnState = _settings.state;
			else
				_btnState = STATE_ENABLE;
				
			changeView(_btnState);
				
			init();
		}
		
		public function init():void
		{
			_btnSkin.addEventListener(MouseEvent.ROLL_OVER, onBtnRollOver);
			_btnSkin.addEventListener(MouseEvent.ROLL_OUT, onBtnRollOut);
			_btnSkin.addEventListener(MouseEvent.MOUSE_DOWN, onBtnDown);
			_btnSkin.addEventListener(MouseEvent.MOUSE_UP, onBtnUp);
			_btnSkin.addEventListener(MouseEvent.CLICK, onBtnClick);
			_btnSkin.addEventListener(MouseEvent.MOUSE_MOVE, onBtnMove);
		}
		
		private function onBtnRollOver(e:MouseEvent):void 
		{
			if (_btnState == STATE_DISABLE)
				return;
			
			changeView(STATE_OVER)
				
			if (_settings.onOver)
				_settings.onOver();
		}
		
		private function onBtnRollOut(e:MouseEvent):void 
		{
			if (_btnState == STATE_DISABLE)
				return;
		
			changeView(_btnState);	
			
			if (_settings.onOut)
				_settings.onOut();
		}
		
		private function onBtnDown(e:MouseEvent):void 
		{
			if (_btnState == STATE_DISABLE)
				return;
			
			if (_settings.onDown)
				_settings.onDown();
		}
		
		private function onBtnUp(e:MouseEvent):void 
		{
			if (_btnState == STATE_DISABLE)
				return;
			
			if (_settings.onUp)
				_settings.onUp();
		}
		
		private function onBtnClick(e:MouseEvent):void 
		{
			if (_btnState == STATE_DISABLE)
				return;
				
			if (_settings.onClick)
				_settings.onClick(e);
		}
		
		private function onBtnMove(e:MouseEvent):void 
		{
			if (_btnState == STATE_DISABLE)
				return;
			
			if (_settings.onMove)
				_settings.onMove();
		}
		
		
		private function changeView(frameLabel:String):void 
		{
			//_btnSkin.gotoAndStop(frameLabel);
		}
		
		
		
		public function get btnSkin():Sprite 
		{
			return _btnSkin;
		}
		
		public function get btnState():String 
		{
			return _btnState;
		}
		
		public function set btnState(value:String):void 
		{
			_btnState = value;
			
			changeView(_btnState);
		}
		
		
		public function dispose():void
		{
			_btnSkin.removeEventListener(MouseEvent.ROLL_OVER, onBtnRollOver);
			_btnSkin.removeEventListener(MouseEvent.ROLL_OUT, onBtnRollOut);
			_btnSkin.removeEventListener(MouseEvent.MOUSE_DOWN, onBtnDown);
			_btnSkin.removeEventListener(MouseEvent.MOUSE_UP, onBtnUp);
			_btnSkin.removeEventListener(MouseEvent.CLICK, onBtnClick);
			_btnSkin.removeEventListener(MouseEvent.MOUSE_MOVE, onBtnMove);
		}
		
	}

}