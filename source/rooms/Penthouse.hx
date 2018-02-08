package rooms;

import adventure.*;
import objects.*;
import rooms.*;

class Penthouse extends Room {
	var nudedone = false;
    override public function create() {
       // scaleFactor = 8;
        objects = [
					new RoomTrigger(6,PenthouseHallway,60,10),
					//new Penlift(29,8),
					new Waterfall(115,11),
					new Waterfall(90,11),
					new Boss(84,15),
					new Curtine(76,1),
					new Block(75),

        			new Player(10,10)];
    }

    override public function update(d){
        super.update(d);
        if (nudedone){
            return;
        }
        if(Player.clothed == false){
            var boss:Boss = get(Boss);
            boss.say("Thats not want I to clear your debt... this time.");
            nudedone = true;
        }

    }

}