package com.sot.game.models
{
	import com.greensock.BlitMask;
	import com.sot.baseEngine.Facade;
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
			rectangle.graphics.drawRect(50, 174, 700,300); // (x spacing, y spacing, width, height)
			rectangle.graphics.endFill(); // not always needed but I like to put it in to end the fill
			Facade.myStage.addChild(rectangle); // add
			
			Facade.gameEnter.middleLayer.mask = rectangle;
			
			
			Facade.myStage.addEventListener(MouseEvent.CLICK, spinReels);
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
			var posY:int = 170;
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
		
		
		//
		/**
		 * Крутить все рилы 
		 * */
		public function spinReels(/*timeDelay:Number = 0.5*/ e:MouseEvent = null):void
		{
			var delay:Number = 0;
			for (var i:int = 0; i < _reelModels.length; i++ ) {
				_reelModels[i].spin(delay);
				delay += 0.2;
			}
		}
		
		/**
		 * Крутить определенный рил по индексу
		 * */
		public function spinReel(/*reelInd:int*/e:MouseEvent = null):void
		{
			_reelModels[2].spin(0);
		}
		
		
		//getters
		
		public function getReel(ind:int):ReelModel
		{
			return _reelModels[ind];
		}
	
	}

}