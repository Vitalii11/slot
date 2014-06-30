package  com.sot.baseEngine.utils 
{
	import com.greensock.TweenMax;
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.utils.ByteArray;

	/**
	 * ...
	 * @author rocket
	 */
	public class Utils 
	{
		public static var toFixedValue:int;
		
		public function Utils() 
		{
			
		}
		
		public static function clearAll($object:Sprite):void 
		{
			if (!$object) return;
			while ($object.numChildren > 0)
				if ($object.getChildAt(0).parent)
					$object.removeChildAt(0);
		}
		
		public static function randRange(minNum:Number, maxNum:Number, round:Boolean = false):Number 
        {
			var value:Number = Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum;
			if (round)
				value = Math.round(value);
				
			return value;
        }
		
		
		public static function cloneObject(source:MovieClip):MovieClip
		{
			var objectClass:Class = Object(source).constructor;
			var instance:MovieClip = new objectClass() as MovieClip;
			instance.transform = source.transform;
			instance.filters = source.filters;
			instance.cacheAsBitmap = source.cacheAsBitmap;
			instance.opaqueBackground = source.opaqueBackground;
			return instance;
		}

		public static function copyObject(objectToCopy:*):*
		{
			var stream:ByteArray = new ByteArray();
			stream.writeObject(objectToCopy);
			stream.position = 0;
  
			return stream.readObject();
		}
		
		public static function countOf($object:Object):int
		{
			var count:int = 0;
			for (var key:String in $object)
				count++;
			
			return count;
		}
		
		public static function checkCopyInArray($arr:Array, $element:Object):Boolean
		{
			if ($arr.indexOf($element) == -1)
				return false;
				
			return true;
		}
		
		public static function valueToFixed($value:Number):String
		{
			if ($value == 0)
				return $value.toString();
				
			return $value.toFixed(toFixedValue);
		}
		
	}

}