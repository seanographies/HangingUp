package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author sean singh
	 */
	public class GV 
	{
		public static var SPEED:Number = 130;
		public static var levelTicket:int;
		public static var frames:int = 9;
		
		public function GV() {
		}
		
		
		
		
		
		public function spikeCollison():void {
			FP.world.removeAll();
			FP.world = new GameWorld(GA.DEATHLEVEL);
		}
		
		
	}
	
			public function changeLevel():void {
			trace("call received");
					if (levelTicket == 1) {
						FP.world = new GameWorld(GA.LEVEL2);
						var world:GameWorld;
					}
					
					if (levelTicket == 2) {
						FP.world.removeAll();
						FP.world = new GameWorld(GA.LEVEL3);
					}
					
					if (levelTicket == 3) {
						FP.world.removeAll();
						FP.world = new GameWorld(GA.LEVEL4);
					}
					
					if (levelTicket == 4) {
						FP.world.removeAll();
						FP.world = new GameWorld(GA.LEVEL5);
					}
					
					if (levelTicket == 5) {
						FP.world.removeAll();
						FP.world = new GameWorld(GA.LEVEL6);
					}
					
					if (levelTicket == 6) {
						FP.world = new GameWorld(GA.END);
						var t1:Text = new Text("This too wayyy too long to make, 18/4/14");
						t1.size = 25;
						var e1:Entity = new Entity( FP.halfWidth, FP.halfHeight,t1);
						FP.world.add(e1);
					}
		}

	
}