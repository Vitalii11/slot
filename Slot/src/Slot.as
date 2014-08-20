package
{
	import game.cursor.Cursor;
	import game.GameEnter;
	import game.helpers.Animations;
	import game.helpers.Hlp;
	import game.helpers.Textures;
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	import flash.display.Sprite;
	import flash.net.LocalConnection;
	import flash.system.Security;
	
	[SWF(width="870", height="670")]
	
	public class Slot extends Sprite
	{
		public function Slot()
		{
			Security.allowDomain("*");
			Security.allowInsecureDomain("*");
			
			Hlp.myStage = stage;
			Hlp.main = this;
			
			Textures.init();
			Animations.init();
			Cursor.init();
			
			setTimeout(function():void{
				var gameEnter:GameEnter = new GameEnter();
				Hlp.gameEnter = gameEnter;
			},500);
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