package com.sot.game.models 
{
	import com.sot.baseEngine.customClasses.ButtonsWrapper;
	import com.sot.baseEngine.Facade;
	import com.sot.game.win.PaytableWindow;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class ButtonsModel extends BaseModel
	{
		private var _bttnWrapers:Vector.<ButtonsWrapper> = new Vector.<ButtonsWrapper>;
		
		public function ButtonsModel() 
		{
			
		}
		
		override public function init():void
		{
			for (var i:int = 0; i < view.numChildren; i++ ) {
				var item:DisplayObject = view.getChildAt(i);
				
				var wraper:ButtonsWrapper;
				
				if (item.name == 'pay_table') {
					wraper = new ButtonsWrapper((item as MovieClip));
					wraper.clickCallback = onOpenPayTable;
					
					_bttnWrapers.push(wraper);
				}else if (item.name == 'reel_all') {
					wraper = new ButtonsWrapper((item as MovieClip));
					wraper.clickCallback = spinReels;
					
					_bttnWrapers.push(wraper);
				}else if (item.name.substr(0, 10) == 'reel_spin_') {
					wraper = new ButtonsWrapper((item as MovieClip));
					wraper.clickCallback = spinReel;
					
					_bttnWrapers.push(wraper);
				}
			}
		}
		
		private function spinReels(e:MouseEvent):void 
		{
			Facade.gameEnter.gameModel.reelsModel.spinReels(0.2);
		}
		
		private function spinReel(e:MouseEvent):void 
		{
			var item:* = e.currentTarget;
			
			Facade.gameEnter.gameModel.reelsModel.spinReel(int(item.name.substr(10, 11)));
		}
		
		private function onOpenPayTable(e:MouseEvent):void
		{
			new PaytableWindow().show();
		}
		
	}

}