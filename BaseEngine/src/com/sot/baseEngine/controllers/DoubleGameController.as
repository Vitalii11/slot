//BaseEngine

package com.sot.baseEngine.controllers
{
	import com.sot.baseEngine.Facade;
	import com.sot.baseEngine.superClasses.BaseClass;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	/*
	*
	*Артем
	*/
	
	public class DoubleGameController extends BaseClass
	{
		private var _skin:MovieClip;
		
		public function DoubleGameController()
		{
			super();
		}
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		override protected function onRegister():void
		{
			skin = Facade.graphicsController.skin[Facade.baseEngineModel.config.doubleGameComponent];
			skin.addEventListener(MouseEvent.CLICK, onMouseClickHandler);
			skin.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverHandler);
		}
		//--------------------------------------------------------------------------
		//
		//  Events handlers
		//
		//--------------------------------------------------------------------------
		protected function onMouseOverHandler(event:MouseEvent):void
		{
			//for override
		}
		
		protected function onMouseClickHandler(event:MouseEvent):void
		{
			//for override
		}
		//--------------------------------------------------------------------------
		//
		//  Getters&setters
		//
		//--------------------------------------------------------------------------
		public function get skin():MovieClip
		{
			return _skin;
		}
		
		public function set skin(value:MovieClip):void
		{
			_skin = value;
		}
		//--------------------------------------------------------------------------
		//
		//  Logs
		//
		//--------------------------------------------------------------------------
	}
}