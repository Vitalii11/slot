package com.sot.game.win 
{
	import com.sot.baseEngine.customClasses.ButtonsWrapper;
	import com.sot.game.data.DataStorage;
	import com.sot.game.data.SlotItemsData;
	import com.sot.game.events.GameEvents;
	import com.sot.game.helpers.Textures;
	import com.sot.game.wrappers.ButtonWrapper;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import com.sot.game.parserData.ParserXML;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class PaytableWindow extends Window
	{
		public static var currentSheet:int = 0;
		private var slotItemsData:SlotItemsData;
		private static var itemsXMLData:Object = { };
		private static var itemsArr:Array = [];
		
		//parser
		private var _parser:ParserXML;
		
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
		
		public function PaytableWindow() 
		{
			super();
			
			setItem(currentSheet);
			
			createArrows();
			drawText();
			drawBody();
			this.y -= 50;
			
			_parser = new ParserXML();
			_parser.addEventListener(GameEvents.XML_COMPLETE, init)
		}
		
		private function init(e:GameEvents):void 
		{
			_parser.removeEventListener(GameEvents.XML_COMPLETE, init);
		}
		
		public static function setData(_itemsXMLData:Object):void 
		{
			itemsXMLData = _itemsXMLData;
		}
		
		public function drawText():void
		{
			allItemsArr = [];
			for (var item:* in itemsXMLData) {
				itemsArr.push(itemsXMLData[item]);
			}
			var itemsLenght:int = itemsArr.length;
			for (var i:int = 0; i < itemsLenght; i++) 
			{
				var text2:TextField = Window.drawText(itemsArr[i].paytable2, {
					fontColor:0x000001,
					borderColor:0xffffff,
					textSize: 32
				});
				var text3:TextField = Window.drawText(itemsArr[i].paytable3, {
					fontColor:0x000001,
					borderColor:0xffffff,
					textSize: 32
				});
				var text4:TextField = Window.drawText(itemsArr[i].paytable4, {
					fontColor:0x000001,
					borderColor:0xffffff,
					textSize: 32
				});
				var text5:TextField = Window.drawText(itemsArr[i].paytable5, {
					fontColor:0x000001,
					borderColor:0xffffff,
					textSize: 32
				});
				this.addChild(text2);
				allItemsArr.push(text2);
				text2.x = 0 + i * text2.width;
				text2.y = 0 + i * text2.height;
				
				this.addChild(text3);
				allItemsArr.push(text3);
				text3.x = 0 + i * text3.width;
				text3.y = 0 + i * text3.height;
				
				this.addChild(text4);
				allItemsArr.push(text4);
				text4.x = 0 + i * text4.width;
				text4.y = 0 + i * text4.height;
				
				this.addChild(text5);
				allItemsArr.push(text5);
				text5.x = 0 + i * text5.width;
				text5.y = 0 + i * text5.height;
			}
			allItemsArr;
			trace();
		}
		
		private function drawBody():void 
		{
			exit.btnSkin.x = 50;
			exit.btnSkin.y = 570;
		}
		
		private var leftArrow:ButtonWrapper;
		private var rightArrow:ButtonWrapper;
		private var allItemsArr:Array;
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