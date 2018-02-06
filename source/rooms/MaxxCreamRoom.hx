package rooms;

import adventure.*;
import objects.*;
import rooms.*;

class MaxxCreamRoom extends Room {
    override public function create() {
        scaleFactor = 8;
        objects = [
					//new RoomTrigger(6,Bar,130,21),
					new MaxxCream(90,15),
					new MaxDoor(21,8),
					new Block(146),
					new Block(6),
					new Camera(11,1),
					new MaxLight(62,2),
        			new Player(10,10)];
    }



}