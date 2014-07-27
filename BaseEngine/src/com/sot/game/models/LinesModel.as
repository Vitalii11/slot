package com.sot.game.models 
{
	import com.sot.baseEngine.customClasses.ButtonsWrapper;
	import com.sot.baseEngine.Facade;
	import com.sot.game.data.DataStorage;
	import com.sot.game.data.Results;
	import com.sot.game.views.BorderView;
	import com.sot.game.wrappers.ButtonWrapper;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	import flash.utils.setTimeout;
	import flash.utils.setTimeout;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class LinesModel extends BaseModel
	{
		private var _lines:Object = { };
		
		private var _bttnWrapers:Object = { };
		
		private var _borderModels:Vector.<BorderModel> = new Vector.<BorderModel>;
		private var _borderViews:Vector.<BorderView> = new Vector.<BorderView>;
		
		private var _masks:Array = [];
		
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
						
						var wraper:ButtonWrapper = new ButtonWrapper((boxLine as MovieClip), {onClick:showLines, state:ButtonWrapper.STATE_ENABLE});
						
						_bttnWrapers[boxLine.name.substr(3)] = wraper;
					}
				}else if (item.name.substr(0,5) == "line_") {
					_lines[item.name.substr(5)] = item;
					item.visible = false;
				}
			}
			
			//creareBorders();
			//createMasks();
		}
		
		//private function creareBorders():void 
		//{
			//for (var j:int = 0; j < DataStorage.instance().countItems; j++) 
			//{
				//var borderView:BorderView = new BorderView();
				//_borderViews.push(borderView);
			//}
			//
			//for (var i:int = 0; i < DataStorage.instance().countItems; i++) 
			//{
				//var borderModel:BorderModel = new BorderModel();
				//
				//borderModel.addView(_borderViews[i]);
				//borderModel.addToStage(Facade.gameEnter.topLayer);
				//borderModel.setCoords(0, 0);
				//borderModel.init();
				//
				//_borderModels.push(borderModel);
			//}
		//}
		
		private function createMasks():void 
		{
			
		}
		
		/**
		 * 
		 * показать бордеры в data передаем позициия бордеров и их тип
		 */
		
		//private var borderPositions:Array = [];
		private var dataBorders:Object;
		private var numBorders:int = 0;
		private var intervalBorder:int = 0;
		public function showBorders(data:Object):void
		{
			if(data.lines.length == 0)
				return;
				
			dataBorders = data;
			numBorders = 0;
			 
			var intTime:int = 0;	
			
			for (var i:int = 0; i < data.lines.length; i++) 
			{
				//borderPositions = Results.lines[data.lines[i] - 1];
				//countBorders = data.counts[i]
				
				setTimeout(showBordersInLine, intTime);
				
				intTime += 1100;
				//for (var j:int = 0; j < data.counts[i]; j++) 
				//{
					//var borderView:BorderView = new BorderView();
					//_borderViews.push(borderView);
					//
					//var borderModel:BorderModel = new BorderModel();
				//
					//borderModel.addView(borderView);
					//borderModel.addToStage(Facade.gameEnter.topLayer);
					//borderModel.setCoords(Results.positionsCoords[borderPositions[j]].x, Results.positionsCoords[borderPositions[j]].y);
					//borderModel.init();
					//
					//_borderModels.push(borderModel);
					//
					//_lines[data.lines[i]].visible = true;
					//hideInterval = setInterval(hideLines, timeToHide);
				//}
				
			}
		}
		
		private function showBordersInLine():void
		{
			var borderPositions:Array = Results.lines[dataBorders.lines[numBorders] - 1];
			var countBorders:int = dataBorders.counts[numBorders];
			
			for (var j:int = 0; j < countBorders; j++) 
			{
				var borderView:BorderView = new BorderView();
				_borderViews.push(borderView);
				
				var borderModel:BorderModel = new BorderModel();
			
				borderModel.addView(borderView);
				borderModel.addToStage(Facade.gameEnter.topLayer);
				borderModel.setCoords(Results.positionsCoords[borderPositions[j]].x, Results.positionsCoords[borderPositions[j]].y);
				borderModel.init();
				
				_borderModels.push(borderModel);
				
				_lines[dataBorders.lines[numBorders]].visible = true;
				
				setTimeout(hideLines, timeToHide);
				setTimeout(hideBorders, timeToHide);
			}
			
			numBorders ++;
		}
		
		private function hideBorders():void 
		{
			for (var i:int = 0; i < _borderModels.length; i++) 
			{
				_borderModels[i].dispose();
			}
			
			for (var j:int = 0; j < _borderViews.length; j++) 
			{
				_borderViews[j] = null;
			}
			
			_borderModels = new Vector.<BorderModel>;
			_borderViews = new Vector.<BorderView>;
		}
		
		private function showLines(e:MouseEvent):void 
		{
			hideLines();
			
			var item:* = e.currentTarget;
			var countLines:int = item.name.substr(3);
			
			GameModel.lines = countLines;
			
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