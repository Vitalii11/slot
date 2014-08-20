package game.models 
{
	import game.buttons.BaseButton;
	import game.data.ButtonsData;
	import game.data.DataStorage;
	import game.helpers.Hlp;
	import game.wins.PayTableWindow;
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
		private var _bttnWrapers:Vector.<BaseButton> = new Vector.<BaseButton>(20);
		
		private var _reelsModel:ReelsModel;
		
		public function ButtonsModel() 
		{
			
		}
		
		override public function init():void
		{
			_reelsModel = Hlp.gameEnter.gameModel.reelsModel;
			
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
			Hlp.gameEnter.topLayer.addChild(button);
			
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