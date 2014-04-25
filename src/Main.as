package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Main extends Engine
	{
		
		public function Main():void 
		{
			super(800, 600, 60);
		}
		
		override public function init():void {
			super.init();
			FP.world = new GameWorld(GA.LEVEL1);
			FP.screen.color = 0x990033;
		}
		
	}
	
}