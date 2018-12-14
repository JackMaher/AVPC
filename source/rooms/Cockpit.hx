package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.FlxG;


class Cockpit extends Room {
    var nudedone = false;
    override public function create() {
        //scaleFactor = 8;
        objects = [
        			new Player(10,10),
                    new RoomTrigger(6,Hallway,110,36),
                    new Floor1fan(8,21),
                    new Floor1fan(8,35),
                    new Cockfore(0,0),
                    new Spacestation(63,18),];
                    //FlxG.timeScale = 2;
        			 
    }
}

class Cockfore extends Object {

    public function new(x,y){
        super(x,y);
        customName = " ";
        layer=FORE;
    }

}