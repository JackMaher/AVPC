package rooms;

import adventure.*;
import objects.*;
import rooms.*;

class Hallway2 extends Room {
    override public function create() {
       // scaleFactor = 8;
        objects = [
					new RoomTrigger(128,Docking,15,37),
					new RoomTrigger(6,Hallway1,110,10),
					new Hallwayfore(0,0),
					new Drinktwink(102,34),
					new Sofa(26,47),
        			new Player(10,10)];
    }



}