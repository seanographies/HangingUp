package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Wall extends Entity 
	{
		public var _image:Image;
		public function Wall(x:Number, y:Number,graphic:Graphic = null) 
		{
			super(x, y, graphic);
			
			setHitbox(32, 32,0,0);
			type = "level";
		}
		
		override public function update():void {
			super.update();
		}
		
	}

}