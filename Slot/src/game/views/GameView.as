package game.views 
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class GameView extends BaseView
	{
		[Embed(source = "../../../asset/images/bg/1.png")]
		private var Img1:Class;
		
		public function GameView() 
		{
			super();
			
			setItem(0);
		}
		
		override public function addImages():void
		{
			images = [(new Img1 as Bitmap)];
		}
		
	}

}