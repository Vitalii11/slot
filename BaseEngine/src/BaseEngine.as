package
{
	import com.sot.baseEngine.Facade;
	import com.sot.baseEngine.controllers.SoundController;
	import com.sot.baseEngine.model.BaseEngineModel;
	import com.sot.game.GameEnter;
	
	import flash.display.Sprite;
	import flash.net.LocalConnection;
	import flash.system.Security;
	
	[SWF(width="834", height="622")]
	
	public class BaseEngine extends Sprite
	{
		public function BaseEngine()
		{
			Security.allowDomain("*");
			Security.allowInsecureDomain("*");
			
			
			var baseEngineModel:BaseEngineModel = new BaseEngineModel();
			Facade.baseEngineModel = baseEngineModel;
			Facade.myStage = stage;
			
			var gameEnter:GameEnter = new GameEnter();
			Facade.gameEnter = gameEnter;
		}
	}
}