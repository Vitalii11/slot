package com.sot.baseEngine.GameCheatMenu.items
{
	import com.sot.baseEngine.GameCheatMenu.CheatMenueConfig;
	import com.sot.baseEngine.GameCheatMenu.MenuXML;
	import com.sot.baseEngine.GameCheatMenu.panels.ItemsPanel;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	
	/**
	 * Элемент для открытия/закрытия панели
	 * @author rocket
	 */
	public class NewPanelItem extends MenuItem
	{
		private var _itemsPanel:ItemsPanel;
		private var _panelName:String;
		
		/**
		 * Элемент для открытия/закрытия панели
		 * @param	$eventName евент который будет диспатчится по клику
		 * @param	$hintText текст подсказки
		 * @param	$image имя картинки
		 * @param	$panelName имя панели которая будет открываться по клику
		 */
		public function NewPanelItem($eventName:String, $eventParams:Object, $hintText:String, $imageName:String, $panelName:String)
		{
			super($eventName, $eventParams, $hintText, $imageName);
			
			_panelName = $panelName;
			
			initPanel();
		}
		
		/**
		 * Содание панели открывающейся по клику на кнопку
		 */
		private function initPanel():void
		{
			_itemsPanel = MenuXML.getPanelByName(_panelName);
			_itemsPanel.setPosition(this);
		}
		
		/**
		 * Закрытие всех панелей кроме главной и тукущей
		 */
		private function closeAllPanels():void
		{
			for each (var panel:ItemsPanel in MenuXML.panelsArray)
			{
				if (panel.panelName != "main" && panel.panelName != _itemsPanel.panelName)
					panel.close();
			}
		}
		
		/**
		 * Открытие/закрытие панели при клике на элемент
		 * @param	e
		 */
		override protected function onMouseClick(e:MouseEvent):void
		{
			super.onMouseClick(e);
			
			if (CheatMenueConfig.CLOSE_ALL_PANELS_ON_CLICK)
			{
				closeAllPanels();
			}
			
			if (_itemsPanel.isOpen)
				_itemsPanel.close();
			else
				_itemsPanel.open();
		}
	
	}

}