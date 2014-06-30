package com.sot.baseEngine.GameCheatMenu 
{
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author rocket
	 */
	public class CheatMenueConfig extends EventDispatcher
	{
		//Размеры главной кнопки
		public static const HEADER_WINDT:int = 64;
		public static const HEADER_HEIGHT:int = 42;
		
		//Размеры остальных кнопок
		public static const ITEM_WINDT:int = 40;
		public static const ITEM_HEIGHT:int = 36;
		
		//Размер шрифта
		public static const ITEM_TEXT_SIZE:int = 10;
		
		//Закрытие всех панелей при открытии какой-то одной
		public static var CLOSE_ALL_PANELS_ON_CLICK:Boolean = true;
		
		//Перетаскивание меню
		public static var USE_DRAG_MENU:Boolean = true;
		
		public function CheatMenueConfig() 
		{
			
		}
		
	}

}