package rooms;

import adventure.*;
import objects.*;
import rooms.*;

class Loohall extends Room {
    override public function create() {
        scaleFactor = 8;
        objects = [
					new RoomTrigger(6,Bar,130,21),
					new RoomTrigger(107,Hallwaybar,10,10),
					new MenLooDoor(24,8),
					new Ladyloodoor(62,8),
					new Ladyloo(64,10),
        			new Player(10,10)];
    }



}