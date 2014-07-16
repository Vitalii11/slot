package com.sot.game 
{
	import com.sot.baseEngine.Facade;
	import com.sot.game.data.DataStorage;
	import com.sot.game.models.GameModel;
	import com.sot.game.views.GameView;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class GameEnter 
	{
		//data
		public var data:DataStorage;
		
		//layers
		public var bottomLayer:Sprite;
		public var middleLayer:Sprite;
		public var topLayer:Sprite;
		public var overLayer:Sprite;
		
		//models
		public var gameModel:GameModel;
		
		//views
		public var gameView:GameView;
		
		public function GameEnter() 
		{
			
		}
		
		public function init():void 
		{
			data = new DataStorage();
			Facade.data = data;
			
			createLayers();
			createViews();
			createModels();
		}
		
		private function createLayers():void 
		{
			bottomLayer = new Sprite();
			middleLayer = new Sprite();
			topLayer = new Sprite();
			overLayer = new Sprite();
			
			Facade.myStage.addChild(bottomLayer);
			Facade.myStage.addChild(middleLayer);
			Facade.myStage.addChild(topLayer);
			Facade.myStage.addChild(overLayer);
		}
		
		private function createViews():void 
		{
			gameView = new GameView();
			//bottomLayer.addChild(gameView);
		}
		
		private function createModels():void 
		{
			gameModel = new GameModel();
			gameModel.addView(gameView);
			gameModel.addToStage(bottomLayer);
			gameModel.setCoords(0, 0);// change on coords from data
			gameModel.init();
		}
		
		// complete load data
		private function onLoad(data:*):void
		{
			data.setData(data);
		}
		
		
		public function clearLayer(layer:Sprite):void
		{
			while (layer.numChildren) {
				layer.removeChild(layer.getChildAt(0));
			}
		}
		
	}

}