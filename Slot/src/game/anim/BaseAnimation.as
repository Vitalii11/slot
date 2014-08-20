package game.anim 
{
	import game.data.SlotItemsData;
	import game.helpers.Animations;
	import game.helpers.Hlp;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.setTimeout;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class BaseAnimation extends Sprite
	{
		public var bitmapContainer:Sprite;
		public var textures:*;
		
		public var framesType:String = "work";
		
		public var framesTypes:Array = [];
		public var multipleAnime:Object = {};
		
		protected var frame:uint = 0;
		protected var frameLength:uint = 0;
		
		private var _isAnim:Boolean = false;
		
		private var _animated:Boolean = false;
		
		public function BaseAnimation() 
		{
			bitmapContainer = new Sprite();
			addChild(bitmapContainer);
		}
		
		public function setItem(name:String):void
		{
			clearAnimation();
			textures = Animations.getByName(name);
			
			initAnimation();
		}
		
		public function initAnimation():void {
			framesTypes = [];
			if (textures && textures.hasOwnProperty('animation')) {
				for (var frameType:String in textures.animation.animations) {
					framesTypes.push(frameType);
				}
				addAnimation();
				animate();
				addImage();
			}
		}
		
		private function addImage():void 
		{
			for each(var name:String in framesTypes) {
				var frame:* 			= multipleAnime[name].frame;
				var cadr:uint 			= textures.animation.animations[name].chain[frame];
				if (multipleAnime[name].cadr != cadr) {
					multipleAnime[name].cadr = cadr;
					var frameObject:Object 	= textures.animation.animations[name].frames[cadr];
					
					multipleAnime[name].bitmap.bitmapData = frameObject.bmd;
					multipleAnime[name].bitmap.smoothing = true;
				}
				break;
			}
			
			//startAnimation();
		}
		
		public function addAnimation():void
		{
			//ax = textures.animation.ax;
			//ay = textures.animation.ay;
			
			clearAnimation();
			
			var arrSorted:Array = [];
			for each(var nm:String in framesTypes) {
				arrSorted.push(nm); 
			}
			arrSorted.sort();
			
			for (var i:int = 0; i < arrSorted.length; i++ ) {
				var name:String = arrSorted[i];
				multipleAnime[name] = { bitmap:new Bitmap(), cadr: -1 };
				bitmapContainer.addChild(multipleAnime[name].bitmap);
				
				if (textures.animation.animations[name]['unvisible'] != undefined && textures.animation.animations[name]['unvisible'] == true) {
					multipleAnime[name].bitmap.visible = false;
				}
				multipleAnime[name]['length'] = textures.animation.animations[name].chain.length;
				multipleAnime[name]['frame'] = 0;
			}
			_isAnim = true;
		}
		
		public function startAnimation(random:Boolean = false):void
		{
			if (_animated) return;
			
			setTimeout(stopAnimation, SlotItemsData.animationTime);
			
			for each(var name:String in framesTypes) {
				
				multipleAnime[name]['length'] = textures.animation.animations[name].chain.length;
				multipleAnime[name].bitmap.visible = true;
				multipleAnime[name]['frame'] = 0;
				if (random) {
					multipleAnime[name]['frame'] = int(Math.random() * multipleAnime[name].length);
				}
			}
			
			Hlp.main.setOnEnterFrame(animate);
			_animated = true;
		}
		
		public function stopAnimation():void
		{
			Hlp.main.setOffEnterFrame(animate);
			_animated = false;
			
			if(_isAnim)
				addImage();
		}
		
		public function clearAnimation():void {
			stopAnimation();
			for (var _name:String in multipleAnime) {
				var btm:Bitmap = multipleAnime[_name].bitmap;
				if (btm && btm.parent)
					btm.parent.removeChild(btm);
			}
		}
		
		public function animate(e:Event = null):void
		{
			for each(var name:String in framesTypes) {
				var frame:* 			= multipleAnime[name].frame;
				var cadr:uint 			= textures.animation.animations[name].chain[frame];
				if (multipleAnime[name].cadr != cadr) {
					multipleAnime[name].cadr = cadr;
					var frameObject:Object 	= textures.animation.animations[name].frames[cadr];
					
					multipleAnime[name].bitmap.bitmapData = frameObject.bmd;
					multipleAnime[name].bitmap.smoothing = true;
					//multipleAnime[name].bitmap.x = frameObject.ox+ax;
					//multipleAnime[name].bitmap.y = frameObject.oy+ay;
				}
				multipleAnime[name].frame++;
				if (multipleAnime[name].frame >= multipleAnime[name].length)
				{
					multipleAnime[name].frame = 0;
				}
			}
		}
		
	}

}