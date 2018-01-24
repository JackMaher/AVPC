package rooms;

import adventure.*;
import objects.*;
import rooms.*;

class Penthouse extends Room {
    override public function create() {
        scaleFactor = 8;
        objects = [
					new RoomTrigger(6,PenthouseHallway,60,10),
					//new Penlift(29,8),
					new Waterfall(115,11),
					new Waterfall(90,11),
					new Boss(84,15),
					new Curtine(76,1),
					new Block(6),
        			new Player(75,10)];
    }



}