package com.sot.baseEngine.GameCheatMenu 
{	
	import com.sot.baseEngine.GameCheatMenu.items.MenuItem;
	import com.sot.baseEngine.GameCheatMenu.items.NewPanelItem;
	import com.sot.baseEngine.GameCheatMenu.panels.ItemsPanel;
	
	/**
	 * ...
	 * @author rocket
	 */
	public class MenuXML 
	{
		/*
		<button event="1" eventParams="" parentPanel="main" image="" text="clear" openPanel=""></button>
		event 		- имя события которое диспатчится при клике
		eventParams - объект собержащий параметры
		parentPanel - панель к которой принадлежит элемент
		image 		- имя картинки
		text 		- текст для подскажки
		З.Ы.		При отлове событий использовать в функции обработчике CheatEvents вкчестве типа данных. для полуения параметров использовать e.data в обработчике
		
		<panel name="main" type="2" direction="4" indentation="3"></panel>
		name		- имя панели
		type		- тип панели (1:горизонтальная 2:вертикальная)
		direction	- сторона отображения относительно кнопки (1:слева 2:справа 3:сверху 4:снизу)
		indentation - отступ между элементами в панели
		*/
		
		private static var _panelsArray:Array;
		private static var _itemsArray:Array;
		
		public static const xml:XML = 
		<root>
			<buttons> 
				<button name="" event="clearUser" eventParams="" parentPanel="main" image="" text="clear" openPanel=""></button>
				<button name="" event="" eventParams="" parentPanel="main" image="" text="money" openPanel="moneyPanel"></button>
				<button name="" event="" eventParams="" parentPanel="main" image="" text="all res" openPanel="allResPanel"></button>
				<button name="" event="" eventParams="" parentPanel="main" image="" text="items" openPanel="specItemsPanel"></button>
				<button name="" event="" eventParams="" parentPanel="main" image="" text="day" openPanel="dailyBonusDay"></button>
				
				<button name="" event="setMoney" eventParams="{money:0}" parentPanel="moneyPanel" text="0" image="" openPanel=""></button>
				<button name="" event="setMoney" eventParams="{money:100}" parentPanel="moneyPanel" text="100" image="" openPanel=""></button>
				<button name="" event="setMoney" eventParams="{money:1000}" parentPanel="moneyPanel" text="1K" image="" openPanel=""></button>
				<button name="" event="setMoney" eventParams="{money:10000}" parentPanel="moneyPanel" text="10K" image="" openPanel=""></button>
				<button name="" event="setMoney" eventParams="{money:100000}" parentPanel="moneyPanel" text="100K" image="" openPanel=""></button>
				
				<button name="" event="setAllRes" eventParams="{value:0}" parentPanel="allResPanel" text="0" image="" openPanel=""></button>
				<button name="" event="setAllRes" eventParams="{value:100}" parentPanel="allResPanel" text="100" image="" openPanel=""></button>
				<button name="" event="setAllRes" eventParams="{value:1000}" parentPanel="allResPanel" text="1K" image="" openPanel=""></button>
				<button name="" event="setAllRes" eventParams="{value:10000}" parentPanel="allResPanel" text="10K" image="" openPanel=""></button>
				<button name="" event="setAllRes" eventParams="{value:100000}" parentPanel="allResPanel" text="100K" image="" openPanel=""></button>
				
				<button name="" event="setSpecItems" eventParams="{value:0}" parentPanel="specItemsPanel" text="0" image="" openPanel=""></button>
				<button name="" event="setSpecItems" eventParams="{value:1}" parentPanel="specItemsPanel" text="1" image="" openPanel=""></button>
				<button name="" event="setSpecItems" eventParams="{value:3}" parentPanel="specItemsPanel" text="3" image="" openPanel=""></button>
				<button name="" event="setSpecItems" eventParams="{value:5}" parentPanel="specItemsPanel" text="5" image="" openPanel=""></button>
				<button name="" event="setSpecItems" eventParams="{value:10}" parentPanel="specItemsPanel" text="10" image="" openPanel=""></button>
				<button name="" event="setSpecItems" eventParams="{value:15}" parentPanel="specItemsPanel" text="15" image="" openPanel=""></button>
				
				<button name="" event="setDailyBonusDay" eventParams="{value:1}" parentPanel="dailyBonusDay" text="day 1" image="" openPanel=""></button>
				<button name="" event="setDailyBonusDay" eventParams="{value:2}" parentPanel="dailyBonusDay" text="day 2" image="" openPanel=""></button>
				<button name="" event="setDailyBonusDay" eventParams="{value:3}" parentPanel="dailyBonusDay" text="day 3" image="" openPanel=""></button>
				<button name="" event="setDailyBonusDay" eventParams="{value:4}" parentPanel="dailyBonusDay" text="day 4" image="" openPanel=""></button>
				<button name="" event="setDailyBonusDay" eventParams="{value:5}" parentPanel="dailyBonusDay" text="day 5" image="" openPanel=""></button>
				<button name="" event="setDailyBonusDay" eventParams="{value:6}" parentPanel="dailyBonusDay" text="day 6" image="" openPanel=""></button>
            </buttons>
            <panels> 
				<panel name="main" type="2" direction="4" indentation="4"></panel>
				<panel name="moneyPanel" type="1" direction="2" indentation="3"></panel>
				<panel name="allResPanel" type="1" direction="2" indentation="3"></panel>
				<panel name="specItemsPanel" type="1" direction="2" indentation="3"></panel>
				<panel name="dailyBonusDay" type="1" direction="2" indentation="3"></panel>
            </panels>
		</root>;
		
		public function MenuXML($xml:XML = null) 
		{
			getPanels();
		}
		
		/**
		 * Получение всех айтемлв
		 * @return
		 */
		private function getItems():Array
		{
			_itemsArray = new Array();
			for (var i:int = 0; i < xml.buttons.button.length(); i++)
			{
				var node:XML = xml.buttons.button[i];
				if (node.@openPanel != "")
					_itemsArray.push(new NewPanelItem(node.@event, node.@eventParams, node.@text, node.@image, node.@openPanel));
				else
					_itemsArray.push(new MenuItem(node.@event, node.@text, node.@image));
			}
			return _itemsArray;
		}
		
		/**
		 * Получение всех панелей
		 * @return
		 */
		private function getPanels():Array
		{
			_panelsArray = new Array();
			for (var i:int = 0; i < xml.panels.panel.length(); i++)
			{
				var node:XML = xml.panels.panel[i];
				_panelsArray.push(new ItemsPanel(node.@name, null, node.@type, node.@direction, node.@indentation));
			}
			
			for each(var panel:ItemsPanel in _panelsArray)
			{
				panel.items = getItemsByPanelName(panel.panelName);
			}
			
			return _panelsArray;
		}
		
		/**
		 * Получение айтемов конкретной панели
		 * @param	$parentPanelName
		 * @return
		 */
		public static function getItemsByPanelName($parentPanelName:String):Array
		{
			var panelItemsArray:Array = new Array();
			for (var i:int = 0; i < xml.buttons.button.(@parentPanel == $parentPanelName).length(); i++)
			{
				var node:XML = xml.buttons.button.(@parentPanel == $parentPanelName)[i];
				if (node.@openPanel != "")
					panelItemsArray.push(new NewPanelItem(node.@event, node.@eventParams, node.@text, node.@image, node.@openPanel));
				else
					panelItemsArray.push(new MenuItem(node.@event, node.@eventParams, node.@text, node.@image));
			}
			return panelItemsArray;
		}
		
		/**
		 * Получение панели по имени
		 * @param	$panelName
		 * @return
		 */
		public static function getPanelByName($panelName:String):ItemsPanel
		{
			for each(var panel:ItemsPanel in _panelsArray)
			{
				if (panel.panelName == $panelName)
					return panel;
			}
			return null;
		}
		
		/**
		 * Массив со всеми панелями
		 */
		static public function get panelsArray():Array { return _panelsArray; }
		
		/**
		 * Массив со всеми элементами
		 */
		static public function get itemsArray():Array { return _itemsArray; }
		
	}

}