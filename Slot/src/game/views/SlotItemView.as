package game.views 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class SlotItemView extends BaseView;
	{
		[Embed(source = "../../../../../asset/images/slotItems/1.png")]
		private var Img1:Class;
		
		[Embed(source = "../../../../../asset/images/slotItems/2.png")]
		private var Img2:Class;
		
		[Embed(source = "../../../../../asset/images/slotItems/3.png")]
		private var Img3:Class;
		
		[Embed(source = "../../../../../asset/images/slotItems/4.png")]
		private var Img4:Class;
		
		[Embed(source = "../../../../../asset/images/slotItems/5.png")]
		private var Img5:Class;
		
		[Embed(source = "../../../../../asset/images/slotItems/6.png")]
		private var Img6:Class;
		
		[Embed(source = "../../../../../asset/images/slotItems/7.png")]
		private var Img7:Class;
		
		[Embed(source = "../../../../../asset/images/slotItems/8.png")]
		private var Img8:Class;
		
		[Embed(source = "../../../../../asset/images/slotItems/9.png")]
		private var Img9:Class;
		
		[Embed(source = "../../../../../asset/images/slotItems/10.png")]
		private var Img10:Class;
		
		[Embed(source = "../../../../../asset/images/slotItems/11.png")]
		private var Img11:Class;
		
		[Embed(source = "../../../../../asset/images/slotItems/12.png")]
		private var Img12:Class;
		
		[Embed(source = "../../../../../asset/images/slotItems/13.png")]
		private var Img13:Class;
		
		[Embed(source = "../../../../../asset/images/slotItems/14.png")]
		private var Img14:Class;
		
		[Embed(source = "../../../../../asset/images/slotItems/15.png")]
		private var Img15:Class;
		
		
		public function SlotItemView() 
		{
			super();
		}
		
		/**
		 * добавление изображенний в массив
		 */
		override public function addImages():void
		{
			images = [(new Img1 as Bitmap), (new Img2 as Bitmap), (new Img3 as Bitmap), (new Img4 as Bitmap), (new Img5 as Bitmap), (new Img6 as Bitmap),
			(new Img7 as Bitmap), (new Img8 as Bitmap), (new Img9 as Bitmap), (new Img10 as Bitmap), (new Img11 as Bitmap), (new Img12 as Bitmap), (new Img13 as Bitmap),
			(new Img14 as Bitmap), (new Img15 as Bitmap)];
		}
		
	}

}