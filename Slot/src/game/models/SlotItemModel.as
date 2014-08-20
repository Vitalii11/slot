package game.models 
{
	import game.anim.BaseAnimation;
	import game.views.BaseView;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class SlotItemModel extends BaseModel
	{
		private var _type:String;
		private var _mode:int;
		
		public function SlotItemModel() 
		{
			
		}
		
		public function setNewType(name:String):void
		{
			_type = name;
			_mode = int(name.substr(4));
			(view as BaseAnimation).setItem(name);
		}
		
		public function get type():String 
		{
			return _type;
		}
		
		public function get mode():int 
		{
			return _mode;
		}
		
	}

}