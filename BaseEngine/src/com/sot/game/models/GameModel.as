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
			
		}
		
		override public function init():void
		{
			createModels();
		}
		
		private function createModels():void 
		{
			reelsModel = new ReelsModel();
		}
		
	}

}