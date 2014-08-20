package game.models 
{
	import game.helpers.Hlp;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class GameModel extends BaseModel
	{
		public static var lines:int = 1;
		
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
			_buttonsModel.init();
			
			_linesModel = new LinesModel();
			_linesModel.addView(new linesAsset());
			_linesModel.addToStage(Hlp.gameEnter.topLayer);
			_linesModel.setCoords(0, 0); 
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