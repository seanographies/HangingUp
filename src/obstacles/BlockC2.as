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
	public class BlockC2 extends Entity 
	{
		private var _image:Image;
		
		public function BlockC2(_x:Number,_y:Number ) 
		{
			x = _x;
			y = _y;
			
			_image = new Image(GA.BLOCKC2);
			graphic = _image;
			
			setHitbox(32, 32);
			type = "Blockc2";
			
		}
		
		override public function update():void {
			super.update();
		}
		
	}

}