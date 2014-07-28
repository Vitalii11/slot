package com.sot.game.views 
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class ReelView extends BaseView//reelAsset
	{
		[Embed(source = "../../../../../asset/images/reels/1.png")]
		private var Img1:Class;
		
		public function ReelView() 
		{
			super();
		}
		
		override public function addImages():void
		{
			images = [(new Img1 as Bitmap)];
		}
		
	}

}