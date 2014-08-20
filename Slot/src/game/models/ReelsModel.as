package game.models
{
	import com.greensock.BlitMask;
	import game.buttons.BaseButton;
	import game.data.DataStorage;
	import game.data.ReelData;
	import game.data.Results;
	import game.helpers.Hlp;
	import game.views.ReelView;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Vitalii
	 */
	public class ReelsModel extends BaseModel
	{
		private var _reelModels:Vector.<ReelModel> = new Vector.<ReelModel>;
		private var _reelViews:Vector.<ReelView> = new Vector.<ReelView>;
		
		//private var blitMask:BlitMask;
		
		public function ReelsModel()
		{
		}
		
		override public function init():void
		{
			createViews();
			createReels();
			
			var rectangle:Shape = new Shape; // initializing the variable named rectangle
			rectangle.graphics.beginFill(0xFF0000); // choosing the colour for the fill, here it is red
			rectangle.graphics.drawRect(30, 36, 810,450); // (x spacing, y spacing, width, height)
			rectangle.graphics.endFill(); // not always needed but I like to put it in to end the fill
			Hlp.myStage.addChild(rectangle); // add
			
			
			Hlp.gameEnter.middleLayer.mask = rectangle;
		}
		
		private function createViews():void 
		{
			for (var i:int = 0; i < Hlp.data.countReels; i++)
			{
				var reelView:ReelView = new ReelView();
				_reelViews.push(reelView);
			}
		}
		
		private function createReels():void
		{
			// for test, then change on coords from data
			var posX:int = 30;
			var posY:int = 36;
			//
			
			for (var i:int = 0; i < Hlp.data.countReels; i++)
			{
				var reel:ReelModel = new ReelModel(this);
				reel.addView(_reelViews[i]);
				reel.addToStage(Hlp.gameEnter.middleLayer);
				reel.setCoords(posX, posY);
				reel.init();
				
				_reelModels.push(reel);
				
				posX += 165; // remove this
			}
			
			Results.createCoords(30, 36, _reelModels[0].getSlotAnim(0).width, _reelModels[0].getSlotAnim(0).height);
		}
		
		private var _startBttn:BaseButton;
		/**
		 * Крутить все рилы 
		 * */
		public function spinReels(timeDelay:Number = 0.5, bttn:BaseButton = null):void
		{
			_startBttn = bttn;
			var delay:Number = 0;
			for (var i:int = 0; i < _reelModels.length; i++ ) {
				if(i == _reelModels.length -1)
					_reelModels[i].spin(delay, onSpinComplete);
				else
					_reelModels[i].spin(delay);
				delay += timeDelay;
			}
			
			DataStorage.instance().credits -= DataStorage.instance().speensCoast * GameModel.lines;
			Hlp.gameEnter.ui.updateTxt('Credits', String(DataStorage.instance().credits));
		}
		
		/**
		 * Крутить определенный рил по индексу
		 * */
		public function spinReel(reelInd:int, bttn:BaseButton = null):void
		{
			_startBttn = bttn;
			
			_reelModels[reelInd - 1].spin(0, onSpinComplete);
			
			DataStorage.instance().credits -= DataStorage.instance().speenCoast * GameModel.lines;
			Hlp.gameEnter.ui.updateTxt('Credits', String(DataStorage.instance().credits));
		}
		
		/**
		 * Остановить все рилы
		 * */
		public function stopReels(timeDelay:Number = 0.5):void
		{
			var delay:Number = 0;
			for (var i:int = 0; i < _reelModels.length; i++) 
			{
				_reelModels[i].stop(delay);
				delay += timeDelay;
			}
		}
		
		/**
		 * Остановить определенный рил по индексу
		 * */
		public function stopReel(reelInd:int):void
		{
			_reelModels[reelInd - 1].stop();
		}
		
		/**
		 * Ф-я вызываемая по окончанию прокрутки рилов
		 * */
		private function onSpinComplete():void
		{
			var resultItems:Object = { };
			
			var count:int = 1;
			for (var i:int = 0; i < _reelModels.length; i++ ) {
				for (var j:int = 0; j < ReelData.instance().slotItemsCount; j++  ) {
					resultItems[count] = _reelModels[i].getSlotModel(j + 4).mode;
					count++;
				}
			}
			
			var resulData:Object = Results.generateResult(resultItems);
			
			DataStorage.instance().credits += int(resulData.win);
			Hlp.gameEnter.ui.updateTxt('Credits', String(DataStorage.instance().credits));
			
			Hlp.gameEnter.gameModel.linesModel.showBorders( { lines:resulData.lines, counts:resulData.count } );
			
			if (_startBttn) {
				_startBttn.state = BaseButton.NORMAL;
				_startBttn = null;
			}
		}
		
		
		//getters
		public function getReel(ind:int):ReelModel
		{
			return _reelModels[ind];
		}
	
	}

}