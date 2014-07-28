package com.sot.game.views 
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class BorderView extends BaseView
	{
		[Embed(source = "../../../../../asset/images/borders/1.png")]
		private var Img1:Class;
		
		[Embed(source = "../../../../../asset/images/borders/2.png")]
		private var Img2:Class;
		
		[Embed(source = "../../../../../asset/images/borders/3.png")]
		private var Img3:Class;
		
		[Embed(source = "../../../../../asset/images/borders/4.png")]
		private var Img4:Class;
		
		[Embed(source = "../../../../../asset/images/borders/5.png")]
		private var Img5:Class;
		
		[Embed(source = "../../../../../asset/images/borders/6.png")]
		private var Img6:Class;
		
		[Embed(source = "../../../../../asset/images/borders/7.png")]
		private var Img7:Class;
		
		[Embed(source = "../../../../../asset/images/borders/8.png")]
		private var Img8:Class;
		
		[Embed(source = "../../../../../asset/images/borders/9.png")]
		private var Img9:Class;
		
		[Embed(source = "../../../../../asset/images/borders/10.png")]
		private var Img10:Class;
		
		[Embed(source = "../../../../../asset/images/borders/11.png")]
		private var Img11:Class;
		
		[Embed(source = "../../../../../asset/images/borders/12.png")]
		private var Img12:Class;
		
		[Embed(source = "../../../../../asset/images/borders/13.png")]
		private var Img13:Class;
		
		[Embed(source = "../../../../../asset/images/borders/14.png")]
		private var Img14:Class;
		
		[Embed(source = "../../../../../asset/images/borders/15.png")]
		private var Img15:Class;
		
		public function BorderView() 
		{
			super();
			
			setItem(0);
		}
		
		override public function addImages():void
		{
			images = [(new Img1 as Bitmap), (new Img2 as Bitmap), (new Img3 as Bitmap), (new Img4 as Bitmap), (new Img5 as Bitmap), (new Img6 as Bitmap),
			(new Img7 as Bitmap), (new Img8 as Bitmap), (new Img9 as Bitmap), (new Img10 as Bitmap), (new Img11 as Bitmap), (new Img12 as Bitmap), (new Img13 as Bitmap),
			(new Img14 as Bitmap), (new Img15 as Bitmap)];
		}
		
	}

}