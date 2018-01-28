package rooms;

import adventure.*;
import objects.*;
import rooms.*;

class Hallway2 extends Room {
    override public function create() {
        scaleFactor = 8;
        objects = [
					new RoomTrigger(128,Docking,15,37),
					new RoomTrigger(6,Hallway1,110,10),
        			new Player(10,10)];
    }



}