package rooms;

import adventure.*;
import objects.*;
import rooms.*;

class Hallwaybar extends Room {
    override public function create() {
        scaleFactor = 8;
        objects = [
					new RoomTrigger(6,Loohall,90,10),
					new Block(109),
					new Nathan(107,11),
					new Hallwaybardoor(45,8),
					new Doorman(71,13),
        			new Player(10,10)];
    }



}