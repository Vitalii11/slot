package com.sot.game.models 
{
	import com.sot.baseEngine.customClasses.ButtonsWrapper;
	import com.sot.baseEngine.Facade;
	import com.sot.game.buttons.BaseButton;
	import com.sot.game.data.ButtonsData;
	import com.sot.game.data.DataStorage;
	import com.sot.game.wins.PayTableWindow;
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
		//private var _bttnWrapers:Vector.<ButtonsWrapper> = new Vector.<ButtonsWrapper>;
		private var _bttnWrapers:Vector.<BaseButton> = new Vector.<BaseButton>(20);
		
		public function ButtonsModel() 
		{
			
		}
		
		override public function init():void
		{
			//for (var i:int = 0; i < view.numChildren; i++ ) {
				//var item:DisplayObject = view.getChildAt(i);
				//
				//var wraper:ButtonsWrapper;
				//
				//if (item.name == 'pay_table') {
					//wraper = new ButtonsWrapper((item as MovieClip));
					//wraper.clickCallback = onOpenPayTable;
					//
					//_bttnWrapers.push(wraper);
				//}else if (item.name == 'reel_all') {
					//wraper = new ButtonsWrapper((item as MovieClip));
					//wraper.clickCallback = spinReels;
					//
					//_bttnWrapers.push(wraper);
				//}else if (item.name.substr(0, 10) == 'reel_spin_') {
					//wraper = new ButtonsWrapper((item as MovieClip));
					//wraper.clickCallback = spinReel;
					//
					//_bttnWrapers.push(wraper);
				//}
			//}
			
			
			var data:Object = ButtonsData.instance().data;
			
			for each(var bttn:* in data) {
				createBttn(bttn);
			}
		}
		
		private function createBttn(data:Object):void 
		{
			switch(data.type) {
				case BaseButton.TYPE_PLAY:
					createPlayBttn(data);
				break;
				case BaseButton.TYPE_REEL:
					createReelBttn(data);
				break;
				case BaseButton.TYPE_SYMPLE:
					createSympleBttn(data);
				break;
			}
		}
		
		private function createPlayBttn(data:Object):void 
		{
			
		}
		
		private function createReelBttn(data:Object):void 
		{
			var button:BaseButton = new BaseButton('bttnCorner', { 
				pading:30,
				width:data.width,
				height:data.height,
				caption:data.name1,
				backing:data.backing,
				onClick:spinReel
			} );
			
			button.x = data.x;
			button.y = data.y;
			button.name = data.name1;
			Facade.gameEnter.topLayer.addChild(button);
			
			_bttnWrapers.push(button);
			//button.addEventListener(MouseEvent.CLICK, spinReel);//вынести слушатель внутрь кнопки
		}
		
		private function createSympleBttn(data:Object):void 
		{
			
		}
		
		private function spinReels(e:MouseEvent):void 
		{
			Facade.gameEnter.gameModel.reelsModel.spinReels(0.2);
			
			DataStorage.instance().credits -= DataStorage.instance().speensCoast * GameModel.lines;
			Facade.gameEnter.ui.updateTxt('Credits', String(DataStorage.instance().credits));
		}
		
		private function spinReel(e:MouseEvent):void 
		{
			var item:* = e.currentTarget;
			
			DataStorage.instance().credits -= DataStorage.instance().speenCoast * GameModel.lines;
			Facade.gameEnter.ui.updateTxt('Credits', String(DataStorage.instance().credits));
			
			Facade.gameEnter.gameModel.reelsModel.spinReel(int(item.name.substr(8, 9)));
		}
		
		private function onOpenPayTable(e:MouseEvent):void
		{
			new PayTableWindow().show();
		}
		
	}

}