package com.sot.game.models 
{
	import com.sot.game.data.ReelData;
	import com.sot.game.views.ReelView;
	import com.sot.game.views.SlotItemView;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class ReelModel extends BaseModel
	{
		public var reelView:ReelView;
		
		private var _slotModels:Vector.<SlotItemModel> = new Vector.<SlotItemModel>;
		private var _slotViews:Vector.<SlotItemView> = new Vector.<SlotItemView>;
		
		private var itemsOverView:int = 2;
		
		public function ReelModel() 
		{
			
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
			var posY:int = -100;
			
			for (var i:int = 0; i < ReelData.instance().slotItemsCount + itemsOverView; i++ ) {
				var slotModel:SlotItemModel = new SlotItemModel();
				slotModel.addView(_slotViews[i]);
				slotModel.addToStage(view);
				slotModel.setCoords(posX, posY);
				slotModel.init();
				
				posY += _slotViews[i].height + 1;
			}
		}
		
	}

}