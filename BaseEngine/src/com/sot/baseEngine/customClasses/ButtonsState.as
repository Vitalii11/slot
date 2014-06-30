package com.sot.baseEngine.customClasses 
{
	/**
	 * ...
	 * @author Jack Klimov
	 */
	public class ButtonsState 
	{
		/** название кадра */
		public var frameLabel:String;
		/** условия (например: MouseEvent.MOUSE_DOWN) */
		public var conditionEvent:String;
		/** доступна ли кнопка */
		public var btnEnable:Boolean = true;
		
		/** функция вызываемая при клике */
		public var clickCallback:Function;
		/** функция вызываемая при наведении курсора */
		public var overCallback:Function;
		/** функция вызываемая при убирании курсора */
		public var outCallback:Function;
		
		/**
		 * Создать новое состояние для кнопки
		 * @param	$frameLabel название кадра с этим состоянием
		 * @param	$conditionEvent условия (например: MouseEvent.MOUSE_DOWN)
		 */
		public function ButtonsState($frameLabel:String, $conditionEvent:String = null)
		{
			this.frameLabel = $frameLabel;
			this.conditionEvent = $conditionEvent;
		}
		
	}

}