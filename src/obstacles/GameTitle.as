package obstacles 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class GameTitle extends Entity 
	{
		public var t:Text;
		public function GameTitle(_x:Number=0, _y:Number=0) 
		{
			x = _x;
			y = _y;
			
			t = new Text("Ahhh haaa, im hanging up, hanging up, baby im hanging up.");
			t.size = 12;
			t.color = 0x000000;
			
			graphic = t;
			
		}
		
		override public function update():void {
			super.update();
		}
		
	}

}