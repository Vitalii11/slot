package com.sot.game.models 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class BaseModel 
	{
		public var view:Sprite;
		
		public function BaseModel() 
		{
			
		}
		
		public function addView(view:Sprite):void
		{
			this.view = view;
		}
		
		public function dispose():void
		{
			if (view.parent)
				view.parent.removeChild(view);
			view = null;
		}
	}

}