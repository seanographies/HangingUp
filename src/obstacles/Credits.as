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
	public class Credits extends Entity 
	{
		private var t:Text = new Text("This took wayyyy too long to make, and it sucks. 19/4/14 - @seanographies")
		public function Credits(x:Number=0, y:Number=0) 
		{
			t.size = 16;
			t.color = 0x000000
			
			graphic = t;
			
			super(x, y);
			
		}
		
	}

}