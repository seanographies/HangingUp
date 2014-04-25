package obstacles 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class block extends Entity 
	{
		private var _image:Image;
		private var _v:Point;
		private var hitRight:Boolean = false;
		private var hitLeft:Boolean = false;
		private var hitUp:Boolean = false;
		private var hitDown:Boolean = false;
		public function block(p:Point) 
		{
			x = p.x;
			y = p.y;
			_v = new Point;
			
			_image = new Image(GA.BLOCK);
			_image.centerOO();
			graphic = _image;
			
			setHitbox(16, 16, 8, 8);
			type = "block";
			
		}
		
		override public function update():void {
			super.update();
			updateMovement();
			updateWallCollision();
		}
		
		protected function updateMovement():void {
			var movement:Point = new Point;
			
			if (collide("Caller", this.left, y)) {
				movement.x++;
			}
			if (collide("Caller", this.right, y)) {
				movement.x--;
			}
			if (collide("Caller", x, this.top)) {
				movement.y++;
			}
			if (collide("Caller", x, this.bottom)) {
				movement.y--;
			}
			_v.x = 140 * FP.elapsed * movement.x;
			_v.y = 140 * FP.elapsed * movement.y;
			
		}
		
		protected function updateWallCollision():void {
			x += _v.x;
			if (collide ("level", x, y)) {
				if (FP.sign(_v.x) > 0) {
					_v.x - 0;
                         x = Math.floor (x / 32) * 32 +32 - width;
                    }else {
                         _v.x - 0;
                         x = Math.floor (x / 32) * 32 + 32;
                    }
               }
            y += _v.y;
            if (collide ("level", x, y)) {
                if (FP.sign(_v.y) > 0){
                    _v.y - 0;
						y = Math.floor (y / 32) * 32 + 32 - height;
                }else {
					_v.y - 0;
						y = Math.floor (y / 32) * 32 + 32;
                }
			}

		}
		
	}

}