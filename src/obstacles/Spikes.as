package obstacles 
{
	import flash.display.Sprite;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author sean singh
	 */
	// this spike class is the default(Facing Down), with other subclasses, only need to change graphic and reset the hitbox
	 public class Spikes extends Entity
	{
		//define dimensions of single frame
		public const SPRITE_WIDTH:Number = 32;
		public const SPRITE_HEIGHT:Number = 32;
		private var spikeSpritemap:Spritemap = new Spritemap(GA.SPRITEMAP, SPRITE_WIDTH, SPRITE_HEIGHT);
		
		private var gameChanger:GV = new GV;
		
		public function Spikes(_x:Number, _y:Number,curAnimation:String = "down")
		{
			x = _x;
			y = _y;
			
			spikeSpritemap.add("down", [21], 0, false);
			spikeSpritemap.add("up", [22], 0, false);
			spikeSpritemap.add("left", [23], 0, false);
			spikeSpritemap.add("right", [24], 0, false);
			graphic = spikeSpritemap;
			spikeSpritemap.play(curAnimation);
			
			//TODO: make more precise hitboxes
			setHitbox(32, 32);
			type = "Spike";
		}
		
		override public function update():void {
			super.update();
			updateCallerCollision();
		}
		
		public function updateCallerCollision():void {
			if (collide("Caller", x, y)) {
				gameChanger.spikeCollison();
			}
		}
		
	}

}