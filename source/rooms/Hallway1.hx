package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.FlxG;


class Hallway1 extends Room {
    override public function create() {
        //scaleFactor = 8;
        objects = [
					new RoomTrigger(138,Hallway2,17,36),
					new H1Door(29,8),
					new Poppers(84,7),
					new Block(8),
        			new Player(10,10)];
        			 FlxG.timeScale = 2;
    }



}