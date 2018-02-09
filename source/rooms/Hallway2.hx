package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.util.FlxColor;

class Hallway2 extends Room {
    var nudedone = false;
    override public function create() {
       // scaleFactor = 8;
        objects = [
					new RoomTrigger(128,Docking,15,37),
					new RoomTrigger(6,Hallway1,110,10),
					new Hallwayfore(0,0),
					new Drinktwink(102,34),
                    new Planthall(62,49),
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
class Planthall extends Object {
    var nameHeard = false;

    public function new(x,y){
        super (x,y);
        speechColor = FlxColor.GREEN;
        layer=BACK;
    }
    override public function update(d){
        super.update(d);
            if (nameHeard){
                customName = "Albert";
            }
            else{
                customName = "Potted Plant";
            }

    }
    override function look(){
        var player:Player = room.get(Player);
        var johnny:Drinktwink = room.get(Drinktwink);
        var albert:Planthall = room.get (Planthall);
        var tree = [
            {time:0.0,run:function(){
                player.walkToObject(Planthall, X, LEFT, function(){
                    Global.canInteract = false;
                    player.flipX = true;
                    player.say("A rather short and stubby Morning Glory plant.");
                });

                player.canControl = false;
            }},
            {time:4.0,run:function(){
                johnny.say("Don't talk to Albert like that he can hear you.");
            }},
            {time:8.0,run:function(){
                player.say("Albert?");
            }},
            {time:12.0,run:function(){
                johnny.say("Yes Albert, hes a grower not a shower.");
            }},
            {time:16.0,run:function(){
                johnny.say("Isn't that right Albert?");
            }},
            {time:20.0,run:function(){
                albert.say("-silence-");
            }},
            {time:24.0,run:function(){
                johnny.say("See he agrees.");
                nameHeard = true;
                player.canControl = true;
                Global.canInteract = true;
            }},
        ];
        Event.run(tree);
    }
}