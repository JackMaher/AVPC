package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.FlxG;


class Hallway extends Room {
    var nudedone = false;
    override public function create() {
        //scaleFactor = 8;
        objects = [
        			new Player(10,10),
                    new RoomTrigger(6,Room1,110,17),
                    new RoomTrigger(120,Cockpit,17,36),
                    new Hallfore1(0,0),
                    new Doorbedroom(32,34),
                    new Sodsbury(75,48),
                    new Airvent(74,32)];
                    //FlxG.timeScale = 2;
        			 
    }
}

class Hallfore1 extends Object {

    public function new(x,y){
        super(x,y);
        customName = " ";
        layer=FORE;
    }
}

class Airvent extends Object {

    public function new(x,y){
        super(x,y);
        customName = "Air Vent";
        layer=BACK;
    }

}
