package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.util.FlxColor;

class Docking extends Room {
    override public function create() {
        scaleFactor = 8;
        objects = [
                                                new Space(49,13),
                    //new Dockwindow(49,13),
                    new RoomTrigger(6,Hallway2,110,36),
                    //new Dockdoor(93,9),
                    //new Dockdoorfront(93,9),
                    new Block(151),
        			new Player(123,37),
                    new Tele(105,28),
                    new SitTwink2(50,41),
                    new SitTwink(83,41),
                    new Hal(75,14),
                    new HalTrigger(88),];
    }



}

class HalTrigger extends Trigger {

    var done = false;
    function trigger (){
        if(done) return;
        done = true;

        var hal:Hal = room.get(Hal);
        hal.say("Hello Packwood", FlxColor.RED);
        hal.say("The Captin is waiting for you in his Penthouse", FlxColor.RED);
    }

}