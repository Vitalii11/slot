package com.sot.game.win 
{
	import com.sot.baseEngine.customClasses.ButtonsWrapper;
	import com.sot.game.data.DataStorage;
	import com.sot.game.helpers.Textures;
	import com.sot.game.wrappers.ButtonWrapper;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class PayTableWindow extends Window
	{
		public static var currentSheet:int = 0;
		
		[Embed(source = "../../../../../asset/images/payTable/1.png")]
		private var Img1:Class;
		
		[Embed(source = "../../../../../asset/images/payTable/2.png")]
		private var Img2:Class;
		
		[Embed(source = "../../../../../asset/images/payTable/3.png")]
		private var Img3:Class;
		
		[Embed(source = "../../../../../asset/images/payTable/4.png")]
		private var Img4:Class;
		
		[Embed(source = "../../../../../asset/images/payTable/5.png")]
		private var Img5:Class;
		
		[Embed(source = "../../../../../asset/images/payTable/6.png")]
		private var Img6:Class;
		
		[Embed(source = "../../../../../asset/images/payTable/7.png")]
		private var Img7:Class;
		
		[Embed(source = "../../../../../asset/images/payTable/8.png")]
		private var Img8:Class;
		
		public function PayTableWindow() 
		{
			super();
			
			setItem(currentSheet);
			
			createArrows();
			
			drawBody();
		}
		
		private function drawBody():void 
		{
			exit.btnSkin.x = 50;
			exit.btnSkin.y = 570;
		}
		
		private var leftArrow:ButtonWrapper;
		private var rightArrow:ButtonWrapper;
		private function createArrows():void 
		{
			var contIcon:MovieClip = new MovieClip();
			var icon:Bitmap = new Textures.arrow_01;// as Bitmap;
			contIcon.addChild(icon);
			leftArrow = new ButtonWrapper(contIcon, { onClick:onLeftSheet } );
			addChild(contIcon);
			contIcon.x = 560;
			contIcon.y = 570;
			
			var contIcon2:MovieClip = new MovieClip();
			var icon2:Bitmap = new Textures.arrow_01;// as Bitmap;
			icon2.scaleX = -1;
			contIcon2.addChild(icon2);
			rightArrow = new ButtonWrapper(contIcon2, { onClick:onRightSheet } );
			addChild(contIcon2);
			contIcon2.x = 830;
			contIcon2.y = 570;
			
			checkArrows();
		}
		
		private function onRightSheet(e:MouseEvent = null):void 
		{
			if (rightArrow.btnState == ButtonWrapper.STATE_DISABLE)
				return;
			
			currentSheet += 1;
				
			setItem(currentSheet);
			checkArrows();
		}
		
		private function onLeftSheet(e:MouseEvent = null):void 
		{
			if (leftArrow.btnState == ButtonWrapper.STATE_DISABLE)
				return;
				
			currentSheet -= 1;
				
			setItem(currentSheet);
			checkArrows();
		}
		
		private function checkArrows():void 
		{
			if (currentSheet <= 0)
				leftArrow.btnState = ButtonWrapper.STATE_DISABLE;
			else 
				leftArrow.btnState = ButtonWrapper.STATE_ENABLE;
				
			if (currentSheet >= DataStorage.instance().payTableSheets-1)
				rightArrow.btnState = ButtonWrapper.STATE_DISABLE;
			else
				rightArrow.btnState = ButtonWrapper.STATE_ENABLE;
				
		}
		
		override public function addImages():void
		{
			images = [(new Img1 as Bitmap), (new Img2 as Bitmap), (new Img3 as Bitmap), (new Img4 as Bitmap), (new Img5 as Bitmap), (new Img6 as Bitmap),
			(new Img7 as Bitmap), (new Img8 as Bitmap)];
		}
		
		override public function dispose():void
		{
			leftArrow.dispose();
			rightArrow.dispose();
			
			leftArrow = null;
			rightArrow = null;
			
			super.dispose();
		}
	}

}