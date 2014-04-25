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
	public class Caller2 extends Entity
	{
		//define dimensions of single frame
		private const SPRITEs_WIDTH:Number = 32;
		private const SPRITEs_HEIGHT:Number = 32;
		
		//default spritemap
		private var playersSpritemap:Spritemap = new Spritemap ( GA.SPRITEMAP, SPRITEs_WIDTH, SPRITEs_HEIGHT);		
		private var _v:Point;
		private var moveSpeed:Number = GV.SPEED;
		private var curAnimation:String = "still";
		
		public var gamesWorld:GameWorld;
		
		public function Caller2(p:Point) 
		{
			//co-ord declaration
			x = p.x;
			y = p.y;
			
			_v = new Point
			
			//spritemaps
			playersSpritemap.add("updown", [8, 9], GV.frames, true);
			playersSpritemap.add("left", [12, 13], GV.frames, true);
			playersSpritemap.add("right", [10, 11], GV.frames, true);
			playersSpritemap.add("still", [7],0,false);
			playersSpritemap.originX = 7;
			graphic = playersSpritemap;
			playersSpritemap.play(curAnimation);
			
			setHitbox(16,26);
			type = "Caller";
		}
		
		override public function update():void {
			super.update();
			updateMovement();
			updateLevelCollision();
			updateCallerBlock();
		}
		
		private function updateMovement():void {
			
			var movement:Point = new Point;
			var horizontalMovement:Boolean = true;
			var verticalMovement:Boolean = true;
			
			playersSpritemap.play(curAnimation);
			
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
			if (collide ("Blockc1", x, y)) {
				if (FP.sign(_v.x) > 0) {
					_v.x - 0;
                         x = Math.floor (x / 32) * 32 + 32 - width;
                    }else {
                         _v.x - 0;
                         x = Math.floor (x / 32) * 32 + 32;
                    }
               }
            if (collide ("Blockc1", x, y)) {
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