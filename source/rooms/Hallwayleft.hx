package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.FlxG;


class Hallwayleft extends Room {
    var nudedone = false;
    override public function create() {
        //scaleFactor = 8;
        objects = [
        			new Player(10,10),
                    new RoomTrigger(125,Room1,10,17),
                    new Decobox(38,38),
                    new Storage1(8,49),
                    new Doorkitchen(78,34)];
                    //FlxG.timeScale = 2;
        			 
    }
}


