package com.sot.game.helpers 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class Textures 
	{
		[Embed(source = "../../../../../asset/images/buttons/arrow_01.png")]
		private static var arrow_01:Class;
		
		[Embed(source = "../../../../../asset/images/buttons/arrow_02.png")]
		private static var arrow_02:Class;
		
		[Embed(source = "../../../../../asset/images/buttons/arrow_03.png")]
		private static var arrow_03:Class;
		
		[Embed(source = "../../../../../asset/images/buttons/back.png")]
		private static var backBttn:Class;
		
		//------------cursor
		[Embed(source = "../../../../../asset/images/cursor/default.png")]
		private static var defaultCursor:Class;
		
		[Embed(source = "../../../../../asset/images/cursor/locked.png")]
		private static var lockedCursor:Class;
		
		[Embed(source = "../../../../../asset/images/cursor/over.png")]
		private static var overCursor:Class;
		
		private static var _data:Dictionary = new Dictionary(true);
		
		public function Textures() 
		{
			
		}
		
		public static function init():void
		{
			_data['defaultCursor'] = (new defaultCursor as Bitmap).bitmapData;
			_data['lockedCursor'] = (new lockedCursor as Bitmap).bitmapData;
			_data['overCursor'] = (new overCursor as Bitmap).bitmapData;
			_data['backBttn'] = (new backBttn as Bitmap).bitmapData;
			_data['arrow_01'] = (new arrow_01 as Bitmap).bitmapData;
			_data['arrow_02'] = (new arrow_02 as Bitmap).bitmapData;
			_data['arrow_03'] = (new arrow_03 as Bitmap).bitmapData;
		}
		
		public static function getByName(name:String):BitmapData
		{
			return _data[name]
		}
		
		public static function backing(width:int, height:int, padding:int, texture:Class):Bitmap 
		{
			var sprite:Sprite = new Sprite();
			
			var topLeft:Bitmap = new texture();
			
			var topRight:Bitmap = new texture();
			topRight.scaleX = -1;
			
			var bottomLeft:Bitmap = new texture();
			bottomLeft.scaleY = -1;
			
			var bottomRight:Bitmap = new texture();
			bottomRight.scaleX = bottomRight.scaleY = -1;
			
			var horizontal:BitmapData = new BitmapData(1, topLeft.height, true, 0);
			horizontal.copyPixels(topLeft.bitmapData,new Rectangle(topLeft.width-1, 0, topLeft.width, topLeft.height), new Point());
			
			var vertical:BitmapData = new BitmapData(topLeft.width, 1, true, 0);
			vertical.copyPixels(topLeft.bitmapData,new Rectangle(0, topLeft.height-1, topLeft.width, topLeft.height), new Point());
			
			var center:BitmapData = new BitmapData(1, 1, true, 0);
			center.copyPixels(topLeft.bitmapData,new Rectangle(topLeft.width - 1, topLeft.height-1, 1, 1), new Point());
			
			topRight.x = width;
			topRight.y = 0;
			
			bottomLeft.x = 0;
			bottomLeft.y = height;
			
			bottomRight.y = height;
			bottomRight.x = width;
			
			var shp:Shape;
			shp = new Shape();
			shp.graphics.beginBitmapFill(horizontal);
			shp.graphics.drawRect(0, 0, width - topLeft.width * 2, topLeft.height);
			shp.graphics.endFill();
			
			var hBmd:BitmapData = new BitmapData(width - topLeft.width * 2, topLeft.height, true, 0);
			hBmd.draw(shp);
			
			var hTopBmp:Bitmap = new Bitmap(hBmd, "auto", true);
			var hBottomBmp:Bitmap = new Bitmap(hBmd, "auto", true);
			hBottomBmp.scaleY = -1;
			
			hTopBmp.x = topLeft.width;
			hTopBmp.y = 0;
			hBottomBmp.x = topLeft.width;
			hBottomBmp.y = height;
			
			shp = new Shape();
			shp.graphics.beginBitmapFill(vertical);
			shp.graphics.drawRect(0, 0, topLeft.width, height - topLeft.height * 2);
			shp.graphics.endFill();

			var vBmd:BitmapData = new BitmapData(topLeft.width, height - topLeft.height * 2, true, 0);
			vBmd.draw(shp);
			
			var vLeftBmp:Bitmap = new Bitmap(vBmd, "auto", true);
			var vRightBmp:Bitmap = new Bitmap(vBmd, "auto", true);
			vRightBmp.scaleX = -1;
			
			vLeftBmp.x = 0;
			vLeftBmp.y = topLeft.height;
			
			vRightBmp.x = width;
			vRightBmp.y = topLeft.height;
			
			var solid:Sprite = new Sprite();
			solid.graphics.beginBitmapFill(center);//beginFill(fillColor);
			solid.graphics.drawRect(padding, padding, width-padding*2, height-padding*2);
			solid.graphics.endFill();
			
			sprite.addChildAt(solid,0);
			
			sprite.addChild(topLeft);
			sprite.addChild(topRight);
			sprite.addChild(bottomLeft);
			sprite.addChild(bottomRight);
			sprite.addChild(hTopBmp);
			sprite.addChild(hBottomBmp);
			sprite.addChild(vLeftBmp);
			sprite.addChild(vRightBmp);
			
			solid = null;
			
			var bg:BitmapData = new BitmapData(sprite.width, sprite.height,true,0x00000000);
			bg.draw(sprite);
						
			for (var i:int = 0; i < sprite.numChildren; i++) {
				sprite.removeChildAt(i);
			}
			sprite = null;
			
			return new Bitmap(bg, "auto", true);
		}
	}

}