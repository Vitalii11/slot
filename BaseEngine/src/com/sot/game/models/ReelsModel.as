package com.sot.game.models
{
	import com.sot.baseEngine.Facade;
	import com.sot.game.views.ReelView;
	
	/**
	 * ...
	 * @author Vitalii
	 */
	public class ReelsModel extends BaseModel
	{
		private var _reelModels:Vector.<ReelModel> = new Vector.<ReelModel>;
		private var _reelViews:Vector.<ReelView> = new Vector.<ReelView>;
		
		public function ReelsModel()
		{
			createViews();
			createReels();
		}
		
		private function createViews():void 
		{
			for (var i:int = 0; i < Facade.data.countReels; i++)
			{
				var reelView:ReelView = new ReelView();
				_reelViews.push(reelView);
			}
			reelView = new ReelView();
		}
		
		private function createReels():void
		{
			// for test, then change on coords from data
			var posX:int = 200;
			var posY:int = 170;
			//
			
			for (var i:int = 0; i < Facade.data.countReels; i++)
			{
				var reel:ReelModel = new ReelModel();
				reel.addView(_reelViews[i]);
				reel.addToStage(Facade.gameEnter.middleLayer);
				reel.setCoords(posX, posY);
				
				_reelModels.push(reel);
				
				posX += 150; // remove this
			}
		}
	
	}

}