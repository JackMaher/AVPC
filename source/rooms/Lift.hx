package rooms;

import adventure.*;
import objects.*;
import rooms.*;

class Lift extends Room {
    var nudedone = false;
    override public function create() {
        //scaleFactor = 8;
        objects = [
					//new RoomTrigger(140,Bathroom,10,10),

					new LiftDoor(17,8),
					new LiftAI(42,13),
					new Block(7),
					new Block(52),
                    new Smallfan(10,4),
        			new Player(15,20)];
    }
    override public function update(d){
        super.update(d);
        if (nudedone){
            return;
        }
        if(Player.clothed == false){
            var lift:LiftAI = get(LiftAI);
            lift.say("Luthberge is bigger.");
            nudedone = true;
        }

    }

}
