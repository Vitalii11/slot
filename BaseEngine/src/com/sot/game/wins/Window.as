package com.sot.game.wins 
{
	import com.greensock.loading.display.ContentDisplay;
	import com.sot.baseEngine.Facade;
	import com.sot.game.helpers.Textures;
	import com.sot.game.views.BaseView;
	import com.sot.game.wrappers.ButtonWrapper;
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
			Facade.gameEnter.overLayer.addChild(this);
			container.x = (Facade.myStage.stageWidth - container.width) / 2;
			container.y = (Facade.myStage.stageHeight - container.height) / 2;
		}
		
		public function dispose():void
		{
			exit.dispose();
			exit = null;
			
			Facade.gameEnter.overLayer.removeChild(this);
		}
		
	}

}