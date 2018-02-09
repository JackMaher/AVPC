package rooms;

import adventure.*;
import objects.*;
import rooms.*;

class Cutscene extends Room {
    override public function create() {
        //scaleFactor = 8;
        objects = [
        			new Player(10,10)];
    }



}