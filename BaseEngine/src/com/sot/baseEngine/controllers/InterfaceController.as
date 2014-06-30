//BaseEngine

package com.sot.baseEngine.controllers
{
	import com.sot.baseEngine.Facade;
	import com.sot.baseEngine.events.ApplicationEvents;
	import com.sot.baseEngine.events.GlobalDispatcher;
	import com.sot.baseEngine.managers.FileManager;
	import com.sot.baseEngine.model.ModelEventConstants;
	import com.sot.baseEngine.superClasses.BaseClass;
	import flash.events.*;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	
	/*
	*
	*@author Artem.Fedorov
	*/
	
	public class InterfaceController extends BaseClass
	{
		
		private var _skin:MovieClip;
		
		
		public function InterfaceController()
		{
			super();
			initHandCursor();
		}
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		override protected function onRegister():void
		{
			if (!Facade.mobileMode)	skin.addEventListener(MouseEvent.CLICK, onMouseClickHandler);
			skin.addEventListener(MouseEvent.CLICK, onMouseClickHandler);
			
			skin.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverHandler);
		}
		
		
		protected function initHandCursor():void
		{
			var i:uint = 0;
			while(i < _skin.numChildren)
			{
				if(_skin.getChildAt(i) is MovieClip && _skin.getChildAt(i).name != "")
				{
					(_skin.getChildAt(i) as MovieClip).buttonMode = true;
					(_skin.getChildAt(i) as MovieClip).useHandCursor = true;
				}
				i++;
			}
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