package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.FlxG;


class Hallway1 extends Room {
    var nudedone = false;
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
                    //new Hall1NudeTrigger (70),
                    new PopTrigger(35),
                    new Poptable(83,28),
        			new Player(10,10)];
                    //FlxG.timeScale = 2;
        			 
    }

    override public function update(d){
        super.update(d);
        var twink1:Poptwink = get(Poptwink);
        var twink2:Poptwink1 = get(Poptwink1);
            if (nudedone){
                return;
            }
        if(Player.clothed == false){
            twink1.say("Ooh Err.");
            twink2.say("*SNIFF SUGGESTIVELY*");
           nudedone = true;
        }

    }

}
class Poptable extends Object {

    public function new(x,y){
        super (x,y);
        customName = "Table";
        layer=BACK;

        ticks = [
            {word:"LOOK", callback:function(){
                look(); 
            }},
        ];
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("Cover in poppers and popper related paraphernalia.");
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
