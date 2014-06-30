package com.sot.baseEngine.customClasses 
{
	import com.sot.baseEngine.managers.FileManager;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author rocket
	 */
	public class CustomSound extends EventDispatcher
	{		
		private var _callbackParams:Object;
		private var _volume:Number;
		private var _loops:int;
		private var _startTime:int;
		private var _fadeInTime:Number;
		private var _fadeOutTime:Number;
		private var _group:String;
		private var _type:String;
		private var _callback:Function;
		private var _soundName:String;
		private var _soundId:String;
		private var _soundTransform:SoundTransform;
		private var _soundChanel:SoundChannel;
		private var _sound:Sound;
		private var _position:int;
		private var _pan:int;
		private var _isMute:Boolean;
		private var _fadeInTimer:Timer;
		private var _soundAfterFade:int;
		private var _startFadeOutTimer:Timer;
		private var _fadeOutTimer:Timer;
		private var _isPause:Boolean;
		private var _stopTime:int;
		private var _stopTimer:Timer;
		
		public function CustomSound($soundName:String, $volume:Number = 1, $startTime:int = 0, $stopTime:int = -1, $loops:int = 0, $fadeInTime:Number = 0, $fadeOutTime:Number = 0, $soundId:String = "") 
		{
			_soundName = $soundName;
			_volume = $fadeInTime == 0 ? $volume : 0;
			_position = $startTime;
			_stopTime = $stopTime;
			_soundId = $soundId;
			_loops = $loops;
			_fadeInTime = $fadeInTime;
			_fadeOutTime = $fadeOutTime;
			_soundAfterFade = $volume;
			
			_isPause = false;
			
			playSound();
		}
		
		private function playSound():void 
		{
			_sound = FileManager.getSoundByName(_soundName);
			if (!_sound) return;
			_soundTransform = new SoundTransform(_volume, 0);
			_soundChanel = _sound.play(_position, _stopTime > -1 ? 0 :_loops < 0 ? 10000 : _loops, _soundTransform);
			_soundChanel.addEventListener(Event.SOUND_COMPLETE, onSoundComplete);
			_fadeInTime = _sound.length < _fadeInTime ? _sound.length : _fadeInTime;
			
			if (_stopTime > -1)
			{
				_stopTimer = new Timer(_stopTime, 1);
				_stopTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onStopTimerComplete);
				_stopTimer.start();
			}
			
			if(_fadeInTime > 0)
			{
				_fadeInTimer = new Timer(1, _fadeInTime / 100);
				_fadeInTimer.addEventListener(TimerEvent.TIMER, onFadeInTimer);
				_fadeInTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onFadeInTimerComplete);
				_fadeInTimer.start();
			}
			
			if (_fadeOutTime > 0)
			{
				_startFadeOutTimer = new Timer(_sound.length - _fadeOutTime, 1)
				_startFadeOutTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onStartFdeOutTimerComplete);
				_startFadeOutTimer.start();
			}
		}
		
		private function onStopTimerComplete(e:TimerEvent):void 
		{
			if (_loops > 0)
			{
				_loops--;
			}
			
			if (_loops == 0)
			{
				_stopTimer.stop();
				_soundChanel.stop();
				_stopTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onStopTimerComplete);
				return;
			}
			
			_soundChanel.stop();
			_soundChanel = _sound.play(_position, 0, _soundTransform);
			_stopTimer.reset();
			_stopTimer.start();
		}
		
		private function onFadeInTimer(e:TimerEvent):void 
		{
			volume += _soundAfterFade / (_fadeInTime / 100);
		}
		
		private function onFadeInTimerComplete(e:TimerEvent):void 
		{
			_fadeInTimer.removeEventListener(TimerEvent.TIMER, onFadeInTimer);
			_fadeInTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onFadeInTimerComplete);
		}
		
		private function onStartFdeOutTimerComplete(e:TimerEvent):void 
		{
			_startFadeOutTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onStartFdeOutTimerComplete);
			
			_fadeOutTimer = new Timer(1, _fadeOutTime / 100);
			_fadeOutTimer.addEventListener(TimerEvent.TIMER, onFadeOutTimer);
			_fadeOutTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onFadeOutTimerComplete);
		}
		
		private function onFadeOutTimer(e:TimerEvent):void 
		{
			volume -= _soundAfterFade / (_fadeOutTime / 100);
		}
		
		private function onFadeOutTimerComplete(e:TimerEvent):void 
		{
			_fadeOutTimer.removeEventListener(TimerEvent.TIMER, onFadeOutTimer);
			_fadeOutTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onFadeOutTimerComplete);
		}
		
		private function onSoundComplete(e:Event):void 
		{
			if (_callback != null)
				if(_callbackParams != null)
					_callback(_callbackParams);
				else
					_callback();
				
			dispatchEvent(e);
		}
		
		public function stopSound($useCallback:Boolean = false):void
		{
			if(!_soundChanel) return;
			_soundChanel.stop();
			if(_stopTimer) _stopTimer.stop();
			if(_fadeInTimer) _fadeInTimer.stop();
			if(_fadeOutTimer) _fadeOutTimer.stop();
			if (_startFadeOutTimer) _startFadeOutTimer.stop();
			
			if (_callback != null && $useCallback)
				if (callbackParams != null)
					_callback(callbackParams);
				else
					_callback();
		}
		
		public function pauseSound():void
		{
			if (!_isPause)
			{
				_position = _soundChanel.position;
				_soundChanel.stop();
				_isPause = true;
			}
		}
		
		public function resumeSound():void
		{
			if (isPause)
			{
				_soundChanel = _sound.play(_position, _stopTime > -1 ? 0 :_loops < 0 ? 10000 : _loops, _soundTransform);
				_isPause = false;
			}
		}
		
		public function get mute():Boolean { return _isMute; };
		public function set mute(value:Boolean):void
		{
			_isMute = value;
			_soundTransform.volume = _isMute ? 0 :_volume;
			_soundChanel.soundTransform = _soundTransform;
			
			if(_fadeInTimer) _fadeInTimer.stop();
			if(_fadeOutTimer) _fadeOutTimer.stop();
		}
		
		public function get setPan():int { return _pan; }
		public function set setPan(value:int):void 
		{
			_pan = value;
			_soundTransform.pan = _pan;
			_soundChanel.soundTransform = _soundTransform;
		}
		
		public function get volume():Number { return _volume; }
		public function set volume(value:Number):void 
		{			
			_volume = value;
			_soundTransform.volume = _volume;
			_soundChanel.soundTransform = _soundTransform;
		}
		
		public function get group():String { return _group; }
		public function set group(value:String):void 
		{
			_group = value;
		}
		
		public function get type():String { return _type; }
		public function set type(value:String):void 
		{
			_type = value;
		}
		
		public function get soundName():String { return _soundName;  }
		
		public function get soundId():String { return _soundId; }
		
		public function get soundChanel():SoundChannel { return _soundChanel; }
		
		public function get sound():Sound { return _sound; }		
		
		public function set callback(value:Function):void 
		{
			_callback = value;
		}
		
		public function get isPause():Boolean { return _isPause; }
		
		public function get callbackParams():Object 
		{
			return _callbackParams;
		}
		
		public function set callbackParams(value:Object):void 
		{
			_callbackParams = value;
		}
		
	}

}