package rooms;

import adventure.*;
import objects.*;
import rooms.*;

import flixel.FlxG;

class Bathroom extends Room {
	   	var nudedone = false;
    override public function create() {
        //scaleFactor = 8;
        objects = [
        			new OccupiedToilet(87,8),
        			new GloryHole(86,26),
					new RoomTrigger(0,Loohall,30,10),
                    new Block (115),
					new Bog(70,21),
        			new Player(10,10)];
    }

        override public function update(d){
        super.update(d);
        if (nudedone){
            return;
        }
        if(Player.clothed == false){
            var twink:OccupiedToilet = get(OccupiedToilet);
            twink.say("My twink senses are tingling.");
            nudedone = true;
        }

    }


}