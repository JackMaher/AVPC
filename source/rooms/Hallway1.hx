package rooms;

import adventure.*;
import objects.*;
import rooms.*;

class Hallway1 extends Room {
    override public function create() {
        scaleFactor = 8;
        objects = [
					//new RoomTrigger(140,Bathroom,10,10),
					new H1Door(29,8),
        			new Player(10,10)];
    }



}