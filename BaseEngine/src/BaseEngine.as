package
{
	import com.sot.baseEngine.Facade;
	import com.sot.baseEngine.controllers.SoundController;
	import com.sot.baseEngine.model.BaseEngineModel;
	import com.sot.game.cursor.Cursor;
	import com.sot.game.GameEnter;
	import com.sot.game.helpers.Animations;
	import com.sot.game.helpers.Textures;
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	import flash.display.Sprite;
	import flash.net.LocalConnection;
	import flash.system.Security;
	
	[SWF(width="870", height="670")]
	
	public class BaseEngine extends Sprite
	{
		public function BaseEngine()
		{
			Security.allowDomain("*");
			Security.allowInsecureDomain("*");
			
			// пока что отключил
			var baseEngineModel:BaseEngineModel = new BaseEngineModel();
			Facade.baseEngineModel = baseEngineModel;
			Facade.myStage = stage;
			
			Facade.main = this;
			
			Textures.init();
			Animations.init();
			Cursor.init();
			
			setTimeout(function():void{
				var gameEnter:GameEnter = new GameEnter();
				Facade.gameEnter = gameEnter;
			},300);
		}
		
		/**
		 * Добавление функции обратного вызова на событие EnterFrame
		 * @param	callback	функция обратного вызова
		 */
		public function setOnEnterFrame(callback:Function):void {
			addEventListener(Event.ENTER_FRAME, callback);
		}
		
		/**
		 * Удаление функции обратного вызова с события EnterFrame
		 * @param	callback	функция обратного вызова
		 */
		public function setOffEnterFrame(callback:Function):void {
			removeEventListener(Event.ENTER_FRAME, callback);
		}
	}
}