package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import obstacles.block;
	import obstacles.BlockC1;
	import obstacles.BlockC2;
	import obstacles.Credits;
	import obstacles.GameTitle;
	import obstacles.PressR;
	import obstacles.Spikes;
	import net.flashpunk.graphics.*;
    import net.flashpunk.masks.*;
    import net.flashpunk.FP;

	
	/**
	 * ...
	 * @author sean singh
	 */
	public class GameWorld extends World 
	{
		protected var caller1:Caller1;
		protected var caller2:Caller2;
		
		protected var map:Entity;
		public var _mapGrid:Grid;
		public var _mapImage:Image;
		protected var _mapData:Class;
		
		public function GameWorld(mapData:Class) 
		{
			_mapData = mapData;
			super(); 
        //save our data and is used in the loadMap function to extract XML
        //load the map file
          loadMap(_mapData);
        //create an image based on the maps data(the white boxes, which are made in OGMO) and scales it
            _mapImage = new Image(_mapGrid.data);
            _mapImage.scale = 32;
        //create a map entity to render and check collision with
           map = new Entity (_mapGrid.x,_mapGrid.y, _mapImage, _mapGrid);
		   map.setHitbox(_mapGrid.width,_mapGrid.height);
		   map.type = "level";
		}
		
		override public function begin():void {
			super.begin();
			add(caller1);
			add(caller2);
			add(map);
		}
		
		protected function loadMap(mapData:Class):void {
			var mapXML:XML = FP.getXML (mapData);
			var node:XML;
			
		//map grid	
            _mapGrid = new Grid(uint(mapXML.@width), (uint(mapXML.@height)), 32, 32, 0, 0);
            _mapGrid.loadFromString(String(mapXML.grid), "", "\n");
		//player
			caller1 = new Caller1(new Point(Number(mapXML.Player.Caller1.@x), (Number(mapXML.Player.Caller1.@y))));
			caller2 = new Caller2(new Point(Number (mapXML.Player.Caller2.@x), (Number(mapXML.Player.Caller2.@y))));
		//objects
			//TODO: parse caller blocks
				
			
			for each (node in mapXML.Objects.sUp) {
				add(new Spikes(int(node.@x), int(node.@y), "up"));
			}
			
			for each (node in mapXML.Objects.sDown) {
				add(new Spikes(int(node.@x), int(node.@y)));
			}
			
			for each (node in mapXML.Objects.sRight) {
				add(new Spikes(int(node.@x), int(node.@y), "right"));
			}
			
			for each (node in mapXML.Objects.sLeft) {
				add(new Spikes(int(node.@x), int(node.@y), "left"));
			}
			
			for each (node in mapXML.Objects.block) {
				add(new block (new Point(Number(mapXML.Objects.block.@x),(Number(mapXML.Objects.block.@y)))));
			}
			
			for each (node in mapXML.Objects.cb1) {
				add(new BlockC1 (int(node.@x), int(node.@y)));
			}
			
			for each (node in mapXML.Objects.cb2) {
				add(new BlockC2 (int(node.@x), int(node.@y)));
			}
			
			for each(node in mapXML.Objects.Title) {
				add(new GameTitle (Number(node.@x), Number(node.@y)));
			}
			
			for each(node in mapXML.Objects.Preesr) {
			add(new PressR(Number(node.@x), Number(node.@y)));
			}
			
			for each(node in mapXML.Objects.Credits) {
			add(new Credits(Number(node.@x), Number(node.@y)));
			}
		}
		public function updateDeath():void {
				removeAll();
				FP.world = GameWorld(this);
		}
		
		
		
	}
}	