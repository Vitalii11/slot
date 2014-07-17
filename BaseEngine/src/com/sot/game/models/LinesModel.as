package com.sot.game.models 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class LinesModel extends BaseModel
	{
		private var _lines:Array = [];
		
		public function LinesModel() 
		{
			
		}
		
		override public function init():void
		{
			for (var i:int = 0; i < view.numChildren; i++ ) {
				var item:DisplayObject = view.getChildAt(i);
				if (item.name.substr(0,5) == "line_") {
					_lines.push(item);
					item.visible = false;
				}
			}
			//доделать
		}
		
		
		/**
		 * получить линию по индексу
		 */
		public function getLine(ind:int):DisplayObject
		{
			return _lines[ind];
		}
		
	}

}