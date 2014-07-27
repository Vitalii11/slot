package com.sot.game.win 
{
	import com.sot.baseEngine.Facade;
	import com.sot.game.views.BaseView;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class Window extends BaseView
	{	
		
		public function Window() 
		{
			
		}
		
		
		
		
		public function show():void
		{
			Facade.gameEnter.overLayer.addChild(this);
		}
		
		public function dispose():void
		{
			
		}
		
	}

}