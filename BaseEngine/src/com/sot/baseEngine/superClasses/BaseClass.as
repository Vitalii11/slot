//BaseEngine

package com.sot.baseEngine.superClasses
{
	import com.greensock.TweenMax;
	import com.sot.baseEngine.Facade;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	
	/*
	*
	*@author Artem.Fedorov
	*/
	
	public class BaseClass
	{
		private var _obj:Sprite;
		private var _objChild:Sprite;
		public function BaseClass()
		{
			_obj = new Sprite();
			_objChild = new Sprite();
			_obj.addChild(_objChild);
			onRegister();
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		protected function onRegister():void
		{
			//for overrride
		}
		
		protected function onDispose():void
		{
			//for overrride
		}
		
		protected function loggerAlert($message:*):void
		{
			if(Facade.debugMode) trace("LOGGER: " + $message as String);
			
		}	
		
		public function delay($time:Number, $callback:Function = null, $callbackParams:Array = null, $repeatCount:int = 0, $onRepeat:Function = null, $onRepeatParams:Array = null):void
		{
			TweenMax.to(_objChild, $time, {onComplete:$callback, onCompleteParams:$callbackParams, repeat:$repeatCount, onRepeat:$onRepeat, onRepeatParams:$onRepeatParams});
		}
		
		public function killDelay($complete:Boolean = false):void
		  {
		   TweenMax.killChildTweensOf(_obj, $complete);
		  }
		
		
		//--------------------------------------------------------------------------
		//
		//  Events handlers
		//
		//--------------------------------------------------------------------------
		//--------------------------------------------------------------------------
		//
		//  Getters&setters
		//
		//--------------------------------------------------------------------------
		//--------------------------------------------------------------------------
		//
		//  Logs
		//
		//--------------------------------------------------------------------------
	}
}