package obstacles 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class PressR extends Entity 
	{
		private var t:Text;
		public function PressR(_x:Number=0, _y:Number=0) 
		{
			x = _x;
			y = _y;
			
			t = new Text("Press r to Restart");
			t.size = 15;
			t.color = 0x000000;
			
			graphic = t;
			
		}
		
		override public function update():void {
			super.update();
		}
		
	}

}