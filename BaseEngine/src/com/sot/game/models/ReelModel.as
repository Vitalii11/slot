package com.sot.game.models 
{
	import com.greensock.easing.Back;
	import com.greensock.easing.Elastic;
	import com.greensock.easing.Linear;
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
		
		private var _callBack:Function = null;
		private var _time:Number = 0.4;
		public function spin(delay:Number, callBack:Function = null):void
		{
			view.y = 104;
			
			_callBack = null;
			_callBack = callBack;
			
			if (delay > 0)
				setTimeout(doSpin, delay * 1000);
			else
				doSpin();
		}
		
		private function doSpin():void
		{
			removeTweens();
			
			_tweenSpin = TweenMax.to(view, _time, {y:view.y + 300, repeat:3, onRepeat:updateSpin, onComplete:lastSpin, ease:Linear.easeNone});
		}
		
		private function updateSpin():void 
		{
			view.y = 104;
			
			for (var i:int = _slotModels.length-1; i >= 0; i-- ) {
				
				if (i >= 3)
					_slotModels[i].setNewType(_slotModels[i-3].type)
				else
					_slotModels[i].setNewType(Math.random()*9 + 1); // поменять на данные из даты
			}
		}
		
		private function lastSpin():void 
		{
			//updateSpin();
			//_tweenLast = TweenMax.to(view, _time + 0.4, {y:view.y + 300, onComplete:completeSpin, ease:Back.easeOut});
		}
		
		private function completeSpin():void 
		{
			if (_callBack != null)
				_callBack();
				
			_callBack = null;
			
			removeTweens();
		}
		
		private function removeTweens():void 
		{
			if (_tweenLast)
				_tweenLast.killVars(view, true);
				
			if (_tweenSpin)
				_tweenSpin.killVars(view, true);
				
			_tweenLast = null;
			_tweenSpin = null;
		}
		
	}

}