package com.sot.game.wrappers 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class ButtonWrapper 
	{
		private var _btnSkin:Sprite;
		
		public function ButtonWrapper(btnSkin:Sprite, settings:Object) 
		{
			
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
		
		public function get btnSkin():Sprite 
		{
			return _btnSkin;
		}
		
	}

}