package com.sot.game.models 
{
	import com.sot.baseEngine.customClasses.ButtonsWrapper;
	import com.sot.game.wrappers.ButtonWrapper;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class LinesModel extends BaseModel
	{
		private var _lines:Object = { };
		
		private var _bttnWrapers:Object = { };
		
		public function LinesModel() 
		{
			
		}
		
		override public function init():void
		{
			for (var i:int = 0; i < view.numChildren; i++ ) {
				var item:DisplayObject = view.getChildAt(i);
				
				if (item.name == "linesNumbers") {
					for (var j:int = 0; j < (item as MovieClip).numChildren; j++ ) {
						var boxLine:DisplayObject = (item as MovieClip).getChildAt(j);
						(boxLine as MovieClip).mouseChildren = false;
						
						//var wraper:ButtonsWrapper = new ButtonsWrapper((boxLine as MovieClip));
						//wraper.clickCallback = showLines;
						
						var wraper:ButtonWrapper = new ButtonWrapper((boxLine as MovieClip), {onClick:showLines, state:ButtonWrapper.STATE_ENABLE});
						
						_bttnWrapers[boxLine.name.substr(3)] = wraper;
					}
				}else if (item.name.substr(0,5) == "line_") {
					_lines[item.name.substr(5)] = item;
					item.visible = false;
				}
			}
		}
		
		private function showLines(e:MouseEvent):void 
		{
			hideLines();
			
			var item:* = e.currentTarget;
			var countLines:int = item.name.substr(3);
			
			var counter:int = 0;
			for each(var line:* in _lines) {
				if (counter >= countLines)
					break;
				
				line.visible = true;
				
				counter++;
			}
			
			setActiveBttn(countLines);
			
			hideInterval = setInterval(hideLines, timeToHide);
		}
		
		private var timeToHide:int = 1000;
		private var hideInterval:int;
		private function hideLines():void
		{
			clearInterval(hideInterval);
			
			for each(var line:* in _lines) {
				line.visible = false;
			}
		}
		
		private function setActiveBttn(ind:int):void
		{
			allActiveOff();
			
			_bttnWrapers[ind].btnState = ButtonWrapper.STATE_ACTIVE;
		}
		
		private function allActiveOff():void
		{
			for each(var bttn:* in _bttnWrapers) {
				if (bttn.btnState == ButtonWrapper.STATE_ACTIVE)
					bttn.btnState = ButtonWrapper.STATE_ENABLE;
			}
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