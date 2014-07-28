package com.sot.game.helpers 
{
	import flash.filters.GlowFilter;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class Hlp 
	{
		
		public function Hlp() 
		{
			
		}
		
		public static function tweenTo():void
		{
			
		}
		
		public static function drawText(text:String, settings:Object = null):TextField {
				
				var defaults:Object = {
					color				: 0xdfdbcf,
					multiline			: false,				//Многострочный текст
					fontSize			: 19,					//Размер шрифта
					textLeading	 		: -3,					//Вертикальное расстояние между словами	
					borderColor 		: 0x000000,//0x5d5d5d,				//Цвет обводки шрифта	
					borderSize 			: 4,					//Размер обводки шрифта
					fontBorderGlow 		: 2,					//Размер размытия шрифта
					//fontFamily		: 'BrushType-SemiBold',		//Шрифт					
					fontFamily			: 'font',		//Шрифт					
					autoSize			: 'none',
					textAlign			: 'left',
					filters				: [],
					sharpness 			: 100,
					thickness			: 50,
					border				: true,
					letterSpacing		: 0,
					input				: false,
					width				: 0,
					wrap				: false,
					angleShadow			:	90,
					strenghtFilter		:	2,
					strenghtShadow		:	8,
					distShadow			:	1
				}
					
				if (settings == null) {
					settings = defaults;
				}else {
					for (var property:* in settings) {
						defaults[property] = settings[property];
					}
					settings = defaults;
				}
				
				var textLabel:TextField = new TextField();
				
				if(settings.input){
					textLabel.type = TextFieldType.INPUT;
					//textLabel.selectable = false;
					//textLabel.tabEnabled = true;
				}else{
					textLabel.mouseEnabled = false;
					textLabel.mouseWheelEnabled = false;
				}
				textLabel.antiAliasType = AntiAliasType.ADVANCED;
				textLabel.multiline = settings.multiline;
				
				switch(settings.autoSize){
					case "left": textLabel.autoSize = TextFieldAutoSize.LEFT; break;
					case "center": textLabel.autoSize = TextFieldAutoSize.CENTER; break;
					case "right": textLabel.autoSize = TextFieldAutoSize.RIGHT; break;
				}
				
				textLabel.embedFonts = true;
				textLabel.sharpness = settings.sharpness;
				textLabel.thickness = settings.thickness;
				//textLabel.border = true;
				
				var style:TextFormat = new TextFormat(); 
				style.color = settings.color; 
				style.letterSpacing = settings.letterSpacing;
				if(settings.multiline){
					style.leading = settings.textLeading; 
				}
				
				style.size = settings.fontSize*fontScale*App._fontScale;
				style.font = settings.fontFamily;
				style.bold = settings.bold || false;
				switch(settings.textAlign) {
					case 'left': style.align = TextFormatAlign.LEFT; break;
					case 'center': style.align = TextFormatAlign.CENTER; break;
					case 'right': style.align = TextFormatAlign.RIGHT; break;
				}
				
				textLabel.defaultTextFormat = style;
				if (text == null) text = "";
				textLabel.text = text;
				
				textLabel.wordWrap = settings.wrap;
				
				var metrics:*;
				if (settings.width > 0) { 
					textLabel.width = settings.width;
					metrics = textLabel.getLineMetrics(0);
					if(text.length > 3 && textLabel.textWidth+metrics.descent > settings.width) {
						while (textLabel.textWidth + metrics.descent > settings.width) {
							settings.fontSize -= 1;
							style.size = settings.fontSize;
							textLabel.setTextFormat(style);
							metrics = textLabel.getLineMetrics(0);
							//textLabel.defaultTextFormat = style;
						}
					}
				}
				textLabel.defaultTextFormat = style;
				
				var filter:GlowFilter;
				var shadowFilter:DropShadowFilter
				if(settings.borderSize>0 && settings.border){
					filter = new GlowFilter(settings.borderColor, 1, settings.borderSize, settings.borderSize, settings.strenghtFilter, 1); //(settings.borderColor, 1, settings.borderSize, settings.borderSize, 6, 1);
					shadowFilter = new DropShadowFilter(settings.distShadow, settings.angleShadow, settings.borderColor, 1, 1, 1, settings.strenghtShadow, 1);  //(1,90,settings.borderColor,0.9,2,2,2,1);
					textLabel.filters = [filter, shadowFilter];
				}			
				
				textLabel.cacheAsBitmap = true;
				
				if (settings.autoSize == 'none') {
					metrics = textLabel.getLineMetrics(0);
					textLabel.height = (textLabel.textHeight || metrics.height) + metrics.descent;
				}
				return textLabel;
			}
		
	}

}