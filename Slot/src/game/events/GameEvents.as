package game.events 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Vitalii
	 */
	public class GameEvents extends Event
	{
		public static const XML_COMPLETE:String = 'xmlComplete';
		
		public function GameEvents(type:String) 
		{
			super(type);
		}
		
	}

}