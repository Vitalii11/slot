package game.models 
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
		
		public function init():void
		{
			// for override
		}
		
		public function addView(view:Sprite):void
		{
			this.view = view;
		}
		
		public function addToStage(container:Sprite):void
		{
			container.addChild(view);
		}
		
		public function setCoords(posX:int, posY:int):void
		{
			view.x = posX;
			view.y = posY;
		}
		
		public function dispose():void
		{
			if (view.parent)
				view.parent.removeChild(view);
			view = null;
		}
	}

}