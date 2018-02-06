package rooms;

import adventure.*;
import objects.*;
import rooms.*;

class Lift extends Room {
    override public function create() {
        //scaleFactor = 8;
        objects = [
					//new RoomTrigger(140,Bathroom,10,10),

					new LiftDoor(17,8),
					new LiftAI(42,13),
					new Block(7),
					new Block(52),
        			new Player(15,20)];
    }



}