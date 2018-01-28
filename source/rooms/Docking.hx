package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.util.FlxColor;

class Docking extends Room {
    override public function create() {
        scaleFactor = 8;
        objects = [
                    new RoomTrigger(6,Hallway2,110,36),
                    new Hal(123,38),
                    new Space(96,11),
                    new Dockdoor(93,9),
                    new Dockingstation(45,22),
                    new Bench(55,51),
                    new Block(151),
                    new Chair (36,50),
        			new Player(106,37),
                    new HalTrigger(88)];
    }



}

class HalTrigger extends Trigger {

    var done = false;
    function trigger (){
        if(done) return;
        done = true;

        var hal:Hal = room.get(Hal);
        hal.say("Hello Dick", FlxColor.RED);
        hal.say("The Captin is waiting for you in his Penthouse", FlxColor.RED);
    }

}