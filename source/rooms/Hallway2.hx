package rooms;

import adventure.*;
import objects.*;
import rooms.*;

class Hallway2 extends Room {
    var nudedone = false;
    override public function create() {
       // scaleFactor = 8;
        objects = [
					new RoomTrigger(128,Docking,15,37),
					new RoomTrigger(6,Hallway1,110,10),
					new Hallwayfore(0,0),
					new Drinktwink(102,34),
					new Sofa(26,47),
					new Floor1fan(76,34),
					new Floor1fan(90,34),
					//new Hall2NudeTrigger (92),
        			new Player(10,10)];
    }


    override public function update(d){
        super.update(d);
        if (nudedone){
            return;
        }
        if(Player.clothed == false){
            var twink:Drinktwink = get(Drinktwink);
            twink.say("Hellloo Sailor.");
            nudedone = true;
        }

    }

}

