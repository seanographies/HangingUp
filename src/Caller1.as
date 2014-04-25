package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Caller1 extends Entity 
	{
		//define dimensions of single frame
		public const SPRITE_WIDTH:Number = 32;
		public const SPRITE_HEIGHT:Number = 32;
		
		//default spritemap
		public var playerSpritemap:Spritemap = new Spritemap(GA.SPRITEMAP, SPRITE_WIDTH, SPRITE_HEIGHT);
		public var _image:Image;
		private var _v:Point;
		private var moveSpeed:Number = GV.SPEED;
		private var curAnimation:String = "still";
		private var gameChanger:GV = new GV
		
		public function Caller1(p:Point) 
		{
			//co-ord declaration
			x = p.x;
			y = p.y;
			
			_v = new Point;
			
			//spritemaps
			playerSpritemap.add("updown", [1, 2], GV.frames, true);
			playerSpritemap.add("left", [3, 4], GV.frames, true);
			playerSpritemap.add("right", [5, 6], GV.frames, true);
			playerSpritemap.add("still", [0], 0, false);
			playerSpritemap.originX = 11;
			graphic = playerSpritemap;
			playerSpritemap.play(curAnimation);
			
			setHitbox(16,26);
			type = "Caller";
		}
		
		override public function update():void {
			super.update();
			updateMovement();
			updateLevelCollision();
			updateCallerBlock();
			updateCallerCollision();
		}
		
		private function updateMovement():void {
			
			var movement:Point = new Point;
			var horizontalMovement:Boolean = true;
			var verticalMovement:Boolean = true;
			
			playerSpritemap.play(curAnimation);
			
			if (Input.check(Key.UP)) {
				movement.y--; 
				curAnimation = "updown";
			} 
			else if (Input.check(Key.DOWN)) {
				movement.y++;
				curAnimation = "updown";
			}
			else verticalMovement = false;
			
			if (Input.check(Key.LEFT)) { 
				movement.x--;
				curAnimation = "left";
			}
			else if (Input.check(Key.RIGHT)) {
				movement.x++;
				curAnimation = "right";
			}
			else horizontalMovement = false;
			
			if ((!verticalMovement) && (!horizontalMovement))
			{
				curAnimation = "still";
			}
			_v.x = moveSpeed * FP.elapsed * movement.x;
			_v.y = moveSpeed * FP.elapsed * movement.y;
			
			if (Input.check (Key.R)) {
				gameChanger.changeLevel();
			}
		}
		
		private function updateLevelCollision():void {
			x += _v.x;
			if (collide ("level", x, y)) {
				if (FP.sign(_v.x) > 0) {
					_v.x - 0;
                         x = Math.floor (x / 32) * 32 + 32 - width;
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
		
		private function updateCallerBlock():void {
			if (collide ("Blockc2", x, y)) {
				if (FP.sign(_v.x) > 0) {
					_v.x - 0;
                         x = Math.floor (x / 32) * 32 + 32 - width;
                    }else {
                         _v.x - 0;
                         x = Math.floor (x / 32) * 32 + 32;
                    }
               }
            if (collide ("Blockc2", x, y)) {
                if (FP.sign(_v.y) > 0){
                    _v.y - 0;
						y = Math.floor (y / 32) * 32 + 32 - height;
                }else {
					_v.y - 0;
						y = Math.floor (y / 32) * 32 + 32;
                }
			}
		}
		
		private function updateCallerCollision():void {
			if (collide ("Caller", x, y)) {
				trace ("call sent");
				GV.levelTicket += 1;
				gameChanger.changeLevel();
			}
		}
		
	}
}
