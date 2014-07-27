package com.sot.game.models 
{
	import com.greensock.easing.Back;
	import com.greensock.easing.Elastic;
	import com.greensock.easing.Linear;
	import com.greensock.easing.Quint;
	import com.greensock.TweenMax;
	import com.sot.game.data.ReelData;
	import com.sot.game.data.SlotItemsData;
	import com.sot.game.views.SlotItemView;
	import flash.events.MouseEvent;
	import flash.utils.clearTimeout;
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
		
		private var _tweenSpin:TweenMax;
		private var _tweenLast:TweenMax;
		
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
			var posY:int = -600;
			
			for (var i:int = 0; i < ReelData.instance().slotItemsCount + itemsOverView; i++ ) {
				var slotModel:SlotItemModel = new SlotItemModel();
				slotModel.addView(_slotViews[i]);
				slotModel.addToStage(view);
				slotModel.setCoords(posX, posY);
				slotModel.init();
				
				slotModel.setNewType(Math.random()*(SlotItemsData.countSlots-1) + 1);//поменять на данные из даты
				
				_slotModels.push(slotModel);
				
				posY += _slotViews[i].height;
			}
		}
		
		private var _callBack:Function = null;
		private var _time:Number = 0.4;
		private var _intervalSpin:int;
		public function spin(delay:Number, callBack:Function = null):void
		{
			view.y = 36;
			
			_callBack = null;
			_callBack = callBack;
			
			removeTweens();
			
			if (delay > 0)
				_intervalSpin = setTimeout(doSpin, delay * 1000);
			else
				doSpin();
		}
		
		private function doSpin():void
		{
			removeTweens();
			
			_tweenSpin = TweenMax.to(view, _time, {y:view.y + 450, repeat:3, onRepeat:updateSpin, onComplete:lastSpin, ease:Linear.easeNone});
		}
		
		private function updateSpin():void 
		{
			view.y = 36;
			
			for (var i:int = _slotModels.length-1; i >= 0; i-- ) {
				
				if (i >= 3)
					_slotModels[i].setNewType(_slotModels[i-3].type)
				else
					_slotModels[i].setNewType(Math.random()*(SlotItemsData.countSlots-1) + 1); // поменять на данные из даты
			}
		}
		
		private function lastSpin():void 
		{
			updateSpin();
			_tweenLast = TweenMax.to(view, _time + 1, {y:view.y + 450, onComplete:completeSpin, ease:Back.easeOut});
		}
		
		private function completeSpin():void 
		{	
			removeTweens();
			
			updateSpin();
			
			if (_callBack != null)
				_callBack();
				
			_callBack = null;
		}
		
		private function removeTweens():void 
		{
			clearTimeout(_intervalSpin);
			
			if (_tweenLast)
				_tweenLast.kill();// Vars(view, true);
				
			if (_tweenSpin)
				_tweenSpin.kill();// Vars(view, true);
				
			_tweenLast = null;
			_tweenSpin = null;
		}
		
		public function getSlotModel(ind:int):SlotItemModel
		{
			return _slotModels[ind];
		}
		
		public function getSlotView(ind:int):SlotItemView
		{
			return _slotViews[ind];
		}
		
	}

}