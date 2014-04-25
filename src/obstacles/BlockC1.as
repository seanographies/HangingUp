package obstacles 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class BlockC1 extends Entity 
	{
		private var _image:Image;
		
		public function BlockC1(_x:Number,_y:Number) 
		{
			x = _x;
			y = _y;
			
			_image = new Image(GA.BLOCKC1);
			graphic = _image;
			
			setHitbox(32, 32);
			type = "Blockc1";
			
		}
		
		override public function update():void {
			super.update();
		}
		
	}

}