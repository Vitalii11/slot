package com.sot.game.models 
{
	import com.sot.game.views.BaseView;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class SlotItemModel extends BaseModel
	{
		private var _type:int;
		
		public function SlotItemModel() 
		{
			
		}
		
		public function setNewType(ind:int):void
		{
			_type = ind;
			(view as BaseView).setItem(ind);
		}
		
		public function get type():int 
		{
			return _type;
		}
		
	}

}