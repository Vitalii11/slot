package com.sot.game.ui 
{
	import com.sot.baseEngine.Facade;
	import com.sot.game.data.TxtFieldsData;
	import com.sot.game.helpers.Hlp;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class UI 
	{
		private var _texts:Object = { };
		
		public function UI() 
		{
			createTxtFields();
		}
		
		private function createTxtFields():void 
		{
			for each(var data:* in TxtFieldsData.instance().data) {
				createTxt(data);
			}
		}
		
		private function createTxt(data:Object):void 
		{
			var txt:TextField = Hlp.drawText('kdncdkwc212131323123'/*data.name*/, {
				color:data.color,
				fontSize:50
			});
			txt.width = txt.textWidth + 10;
			txt.x = 100;// data.x;
			txt.y = 100;// data.y;
			
			Facade.gameEnter.overLayer.addChild(txt);
			
			_texts[data.name] = txt;
		}
		
		public function updateTxt(name:String, text:String):void
		{
			_texts[name].text = text;
		}
		
	}

}