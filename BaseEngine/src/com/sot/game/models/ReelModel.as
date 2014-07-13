package com.sot.game.models 
{
	import com.greensock.TweenMax;
	import com.sot.game.data.ReelData;
	import com.sot.game.views.SlotItemView;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class ReelModel extends BaseModel
	{
		private var _reelsModel:ReelsModel;
		
		private var _slotModels:Vector.<SlotItemModel> = new Vector.<SlotItemModel>;
		private var _slotViews:Vector.<SlotItemView> = new Vector.<SlotItemView>;
		
		private var itemsOverView:int = 5;
		
		public function ReelModel(reelsModel:ReelsModel) 
		{
			_reelsModel = reelsModel;
		}
		
		override public function init():void
		{
			createViews()
			createSlotItems();
		}
		
		private function createViews():void 
		{
			for (var i:int = 0; i < ReelData.instance().slotItemsCount + itemsOverView; i++ ) 
			{
				var slotView:SlotItemView = new SlotItemView();
				_slotViews.push(slotView);
			}
		}
		
		private function createSlotItems():void 
		{
			var posX:int = 0;
			var posY:int = -400;
			
			for (var i:int = 0; i < ReelData.instance().slotItemsCount + itemsOverView; i++ ) {
				var slotModel:SlotItemModel = new SlotItemModel();
				slotModel.addView(_slotViews[i]);
				slotModel.addToStage(view);
				slotModel.setCoords(posX, posY);
				slotModel.init();
				
				slotModel.setNewType(Math.random()*9 + 1);//поменять на данные из даты
				
				_slotModels.push(slotModel);
				
				posY += _slotViews[i].height + 1;
			}
		}
		
		
		private var _time:Number = 0.4;
		public function spin(delay:Number):void
		{
			view.y = 170;
			
			if (delay > 0)
				setTimeout(doSpin, delay * 1000);
			else
				doSpin();
		}
		
		private function doSpin():void
		{
			TweenMax.to(view, _time, {y:view.y + 300, repeat:5, onRepeat:repeatSpin, onComplete:repeatSpin});
		}
		
		private function repeatSpin():void 
		{
			view.y = 170;
			//_time -= 0.2;
			for (var i:int = _slotModels.length-1; i >= 0; i-- ) {
				
				if (i >= 3)
					_slotModels[i].setNewType(_slotModels[i-3].type)
				else
					_slotModels[i].setNewType(Math.random()*9 + 1); // поменять на данные из даты
			}
		}
		
	}

}