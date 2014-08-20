package game.wins 
{
	import com.greensock.loading.display.ContentDisplay;
	import game.helpers.Hlp;
	import game.helpers.Textures;
	import game.views.BaseView;
	import game.wrappers.ButtonWrapper;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class Window extends BaseView
	{	
		public var exit:ButtonWrapper;
		public static var fontScale:Number =1;
		public function Window() 
		{
			super();
			
			createExit();
		}
		
		public function createExit():void 
		{
			var exitCont:MovieClip = new MovieClip();
			var exitIcon:Bitmap = new Bitmap(Textures.getByName('backBttn'));
			
			exitCont.addChild(exitIcon);
			addChild(exitCont);
			
			exit = new ButtonWrapper(exitCont, {onClick:onExit});
		}
		
		
		private function onExit(e:MouseEvent = null):void 
		{
			dispose();
		}
		
		public function show():void
		{
			Hlp.gameEnter.overLayer.addChild(this);
			container.x = (Hlp.myStage.stageWidth - container.width) / 2;
			container.y = (Hlp.myStage.stageHeight - container.height) / 2;
		}
		
		public function dispose():void
		{
			exit.dispose();
			exit = null;
			
			Hlp.gameEnter.overLayer.removeChild(this);
		}
		
	}

}