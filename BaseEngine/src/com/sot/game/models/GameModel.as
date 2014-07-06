package com.sot.game.models 
{
	/**
	 * ...
	 * @author Vitalii
	 */
	public class GameModel extends BaseModel
	{
		public var reelsModel:ReelsModel;
		
		
		public function GameModel() 
		{
			createModels();
		}
		
		private function createModels():void 
		{
			reelsModel = new ReelsModel();
		}
		
	}

}