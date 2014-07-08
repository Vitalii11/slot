package com.sot.game.models 
{
	/**
	 * ...
	 * @author Vitalii
	 */
	public class GameModel extends BaseModel
	{
		private var _reelsModel:ReelsModel;
		
		
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
		}
		
		public function get reelsModel():ReelsModel 
		{
			return _reelsModel;
		}
		
	}

}