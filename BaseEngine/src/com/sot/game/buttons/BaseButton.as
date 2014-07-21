package com.sot.game.buttons 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class BaseButton extends Sprite
	{
		private var _settings:Object;
		
		public function BaseButton(settings:Object) 
		{
			_settings = settings;
		}
		
		
		
		public function get settings():Object 
		{
			return _settings;
		}
		
	}

}