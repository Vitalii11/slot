package com.sot.game.models 
{
	import com.sot.baseEngine.Facade;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class GameModel extends BaseModel
	{
		private var _reelsModel:ReelsModel;
		
		private var _buttonsModel:ButtonsModel;
		
		private var _linesModel:LinesModel;
		
		
		public function GameModel() 
		{
			
		}
		
		override public function init():void
		{
			createModels();
		}
		
		private function createModels():void 
		{
			_reelsModel = new ReelsModel();
			_reelsModel.init();
			
			_buttonsModel = new ButtonsModel();
			_buttonsModel.addView(new spinBttnsAsset());
			_buttonsModel.addToStage(Facade.gameEnter.topLayer);
			_buttonsModel.setCoords(40, 470); //change 
			_buttonsModel.init();
			
			_linesModel = new LinesModel();
			_linesModel.addView(new linesAsset());
			_linesModel.addToStage(Facade.gameEnter.topLayer);
			_linesModel.setCoords(0, 0); //change 
			_linesModel.init();
		}
		
		
		
		public function get reelsModel():ReelsModel 
		{
			return _reelsModel;
		}
		
		public function get buttonsModel():ButtonsModel 
		{
			return _buttonsModel;
		}
		
		public function get linesModel():LinesModel 
		{
			return _linesModel;
		}
		
	}

}