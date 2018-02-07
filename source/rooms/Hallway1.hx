package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.FlxG;


class Hallway1 extends Room {
    override public function create() {
        //scaleFactor = 8;
        objects = [
					new RoomTrigger(138,Hallway2,17,36),
					new H1Door(29,8),
                    new Poptwink1(94,14),
                    new Poptwink(62,16),
					new Poppers(84,7),
					new Block(8),
                    new PopTrigger(110),
                    new Hall1NudeTrigger (70),
                    new PopTrigger(35),
        			new Player(10,10)];
                    FlxG.timeScale = 2;
        			 
    }

}
class PopTrigger extends Trigger {

    var done = false;
    function trigger (){
        if(done) return;
        done = true;

        var twink1:Poptwink = room.get(Poptwink);
        var twink2:Poptwink1 = room.get(Poptwink1);
        twink1.say("-SNIFF-", null, 2);
        twink2.say("-SNIFF-", null, 1);
    }

}


class Hall1NudeTrigger extends Trigger{
    var done:Bool = false;

    function trigger(){
    var twink1:Poptwink = room.get(Poptwink);
    var twink2:Poptwink1 = room.get(Poptwink1);
        if (done){
            return;
        }
        if(Player.clothed == false){
            twink1.say("Ooh Err.");
            twink2.say("*SNIFF SUGGESTIVELY*");
            done = true;
        }
    }

}