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
		
		private var _reelsModel:ReelsModel;
		
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
			
			_reelsModel = Facade.gameEnter.gameModel.reelsModel;
			
			var data:Object = ButtonsData.instance().data;
			
			for each(var bttn:* in data) {
				createBttn(bttn);
			}
		}
		
		private function createBttn(data:Object):void 
		{
			switch(data.type) {
				case BaseButton.TYPE_PLAY:
					createReelBttn(data, spinReels);
				break;
				case BaseButton.TYPE_REEL:
					createReelBttn(data, spinReel);
				break;
				case BaseButton.TYPE_SYMPLE:
					createSympleBttn(data);
				break;
			}
		}
		
		private function createPlayBttn(data:Object):void 
		{
			
		}
		
		private function createReelBttn(data:Object, callBack:Function):void 
		{
			var button:BaseButton = new BaseButton('bttnCorner', { 
				pading            :30,
				width             :data.width,
				height            :data.height,
				caption1          :data.name1,
				caption2          :data.name2,
				caption3          :data.name3,
				backing           :data.backing,
				onClick           :callBack,
				fontColor         :data.color,
				fontBorderColor   :data.borderColor,
				fontSize          :data.fontSize
			} );
			
			button.x = data.x;
			button.y = data.y;
			button.name = data.name1;
			Facade.gameEnter.topLayer.addChild(button);
			
			_bttnWrapers.push(button);
		}
		
		private function createSympleBttn(data:Object):void 
		{
			
		}
		
		private function spinReels(e:MouseEvent):void 
		{
			var bttn:BaseButton = e.currentTarget as BaseButton;
			
			if (bttn.mode == BaseButton.DISABLED)
				return;
			
			switch(bttn.mode) {
				case BaseButton.NORMAL:
					_reelsModel.spinReels(0.2, bttn);
					bttn.state = BaseButton.ACTIVE;
				break;
				case BaseButton.ACTIVE:
					_reelsModel.stopReels(0.2);
					bttn.state = BaseButton.DISABLED;
				break;
				//case BaseButton.DONE:
					//
				//break;
			}
		}
		
		private function spinReel(e:MouseEvent):void 
		{	
			var bttn:BaseButton = e.currentTarget as BaseButton;
			
			if (bttn.mode == BaseButton.DISABLED)
				return;
			
			switch(bttn.mode) {
				case BaseButton.NORMAL:
					_reelsModel.spinReel(int(bttn.name.substr(8, 9)), bttn);
					bttn.state = BaseButton.ACTIVE;
				break;
				case BaseButton.ACTIVE:
					_reelsModel.stopReel(int(bttn.name.substr(8, 9)));
					bttn.state = BaseButton.DISABLED;
				break;
				//case BaseButton.DONE:
					//
				//break;
			}
			
		}
		
		private function onOpenPayTable(e:MouseEvent):void
		{
			new PayTableWindow().show();
		}
		
	}

}