package game 
{
	import game.data.DataStorage;
	import game.events.GameEvents;
	import game.helpers.Hlp;
	import game.models.GameModel;
	import game.parserData.ParserXML;
	import game.ui.UI;
	import game.views.GameView;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.Font;
	/**
	 * ...
	 * @author Vitalii
	 */
	 
	public class GameEnter 
	{
		//data
		public var data:DataStorage;
		
		//layers
		public var bottomLayer:Sprite;
		public var middleLayer:Sprite;
		public var topLayer:Sprite;
		public var overLayer:Sprite;
		
		//models
		public var gameModel:GameModel;
		
		//views
		public var gameView:GameView;
		
		public var ui:UI;
		
		//parser
		private var _parser:ParserXML;
		
		[Embed(source = "../../asset/fonts/CarnevaleeFreakshow.ttf",  fontName = "font",  mimeType = "application/x-font-truetype", fontWeight = "normal", fontStyle = "normal", advancedAntiAliasing = "true", embedAsCFF = "false")]
		private var font:Class;
		
		public function GameEnter() 
		{
			Font.registerFont(font);
			
			data = new DataStorage();
			Hlp.data = data;
			
			_parser = new ParserXML();
			_parser.addEventListener(GameEvents.XML_COMPLETE, init);
		}
		
		public function init(e:Event = null):void 
		{
			_parser.removeEventListener(GameEvents.XML_COMPLETE, init);
			
			createLayers();
			createViews();
			createModels();
			
			ui = new UI();
		}
		
		private function createLayers():void 
		{
			bottomLayer = new Sprite();
			middleLayer = new Sprite();
			topLayer = new Sprite();
			overLayer = new Sprite();
			
			Hlp.myStage.addChild(bottomLayer);
			Hlp.myStage.addChild(middleLayer);
			Hlp.myStage.addChild(topLayer);
			Hlp.myStage.addChild(overLayer);
		}
		
		private function createViews():void 
		{
			gameView = new GameView();
			//bottomLayer.addChild(gameView);
		}
		
		private function createModels():void 
		{
			gameModel = new GameModel();
			gameModel.addView(gameView);
			gameModel.addToStage(bottomLayer);
			gameModel.setCoords(0, 0);// change on coords from data
			gameModel.init();
		}
		
		// complete load data
		private function onLoad(data:*):void
		{
			data.setData(data);
		}
		
		public function clearLayer(layer:Sprite):void
		{
			while (layer.numChildren) {
				layer.removeChild(layer.getChildAt(0));
			}
		}
		
	}

}