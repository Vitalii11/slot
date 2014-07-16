package com.sot.game.models
{
	import com.greensock.BlitMask;
	import com.sot.baseEngine.Facade;
	import com.sot.game.data.Results;
	import com.sot.game.views.ReelView;
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
		
		private var blitMask:BlitMask;
		
		public function ReelsModel()
		{
		}
		
		override public function init():void
		{
			createViews();
			createReels();
			
			//blitMask = new BlitMask(Facade.gameEnter.middleLayer, 50, 174, 700, 300, true, true, 0, true);
			var rectangle:Shape = new Shape; // initializing the variable named rectangle
			rectangle.graphics.beginFill(0xFF0000); // choosing the colour for the fill, here it is red
			rectangle.graphics.drawRect(50, 108, 700,300); // (x spacing, y spacing, width, height)
			rectangle.graphics.endFill(); // not always needed but I like to put it in to end the fill
			Facade.myStage.addChild(rectangle); // add
			
			
			Facade.gameEnter.middleLayer.mask = rectangle;
			
			
			//Facade.myStage.addEventListener(MouseEvent.CLICK, spinReels);
		}
		
		private function createViews():void 
		{
			for (var i:int = 0; i < Facade.data.countReels; i++)
			{
				var reelView:ReelView = new ReelView();
				_reelViews.push(reelView);
			}
		}
		
		private function createReels():void
		{
			// for test, then change on coords from data
			var posX:int = 50;
			var posY:int = 104;
			//
			
			for (var i:int = 0; i < Facade.data.countReels; i++)
			{
				var reel:ReelModel = new ReelModel(this);
				reel.addView(_reelViews[i]);
				reel.addToStage(Facade.gameEnter.middleLayer);
				reel.setCoords(posX, posY);
				reel.init();
				
				_reelModels.push(reel);
				
				posX += 150; // remove this
			}
		}
		
		
		/**
		 * Крутить все рилы 
		 * */
		public function spinReels(timeDelay:Number = 0.5):void
		{
			var delay:Number = 0;
			for (var i:int = 0; i < _reelModels.length; i++ ) {
				if(i == _reelModels.length -1)
					_reelModels[i].spin(delay, onSpinComplete);
				else
					_reelModels[i].spin(delay);
				delay += timeDelay;
			}
		}
		
		/**
		 * Крутить определенный рил по индексу
		 * */
		public function spinReel(reelInd:int):void
		{
			_reelModels[reelInd].spin(0);
		}
		
		/**
		 * Ф-я вызываемая по окончанию прокрутки рилов
		 * */
		private function onSpinComplete():void
		{
			Results.generateResult();
		}
		
		
		//getters
		
		public function getReel(ind:int):ReelModel
		{
			return _reelModels[ind];
		}
	
	}

}