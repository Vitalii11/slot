package com.sot.game.views 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class BaseView extends Sprite
	{
		public var images:Array = [];//Vector.<Bitmap> = new Vector.<Bitmap>;
		
		public var container:Sprite = null;
		
		private var _image:Bitmap = null;
		
		public function BaseView() 
		{
			addContainer();
			addImage();
			addImages();
		}
		
		/**
		 * добавление контейнера
		 */
		public function addContainer():void 
		{
			container = new Sprite();
			addChild(container);
		}
		
		/**
		 * добавление изображение
		 */
		public function addImage():void 
		{
			_image = new Bitmap();
			container.addChild(_image);
		}
		
		/**
		 * добавление изображенний в массив (функция для переопределения)
		 */
		public function addImages():void
		{
			
		}
		
		/**
		 * устоновить координаты изображения
		 */
		public function setCoords(posX:int, posY:int):void
		{
			_image.x = posX;
			_image.y = posY;
		}
		
		/**
		 * устоновить тип элемента по индексу
		 */
		public function setItem(ind:uint):void
		{
			//clearContainer();
			
			_image.bitmapData = images[ind].bitmapData;
		}
		
		private function clearContainer():void
		{
			while (container.numChildren) {
				container.removeChild(container.getChildAt(0));
			}
		}
		
	}

}