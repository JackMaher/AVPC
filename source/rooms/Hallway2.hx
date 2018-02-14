package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.FlxG;
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

        			new Player(10,37)];
    }


    override public function update(d){
        super.update(d);
        if (nudedone){
            return;
        }
        if(Player.clothed == false){
            var hello = [
                {time:1.0, run:function() {
                    var twink:Drinktwink = get(Drinktwink);
                    twink.say("Hellloo Sailor.",null,2.5);
                    FlxG.sound.play("assets/voices/hallway2/johnny/hello-sailor.ogg");
                }}
            ];
            Event.run(hello);
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
                ticks = [
            {word:"LOOK", callback:function(){
                look(); 
            }},
        ];
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
    override function use(){
        look();
    }
    override function look(){
        var player:Player = room.get(Player);
        var johnny:Drinktwink = room.get(Drinktwink);
        var albert:Planthall = room.get (Planthall);
        var tree = [
            {time:0.0,run:function(){
                player.walkToObject(Planthall, X, LEFT, function(){
                    Global.cutscene = true;
                    player.flipX = true;
                    player.say("A rather short and stubby Morning Glory plant.");
                    FlxG.sound.play("assets/voices/hallway2/rodger/morning-glory.ogg");
                });

                player.canControl = false;
            }},
            {time:4.0,run:function(){
                johnny.say("Don't talk to Albert like that he can hear you.");
                FlxG.sound.play("assets/voices/hallway2/johnny/dont-talk.ogg");
            }},
            {time:7.5,run:function(){
                player.say("Albert?",null,2);
                FlxG.sound.play("assets/voices/hallway2/rodger/albert.ogg");
            }},
            {time:9.0,run:function(){
                johnny.say("Yes Albert, hes a grower not a shower.");
                FlxG.sound.play("assets/voices/hallway2/johnny/grower.ogg");
            }},
            {time:13.0,run:function(){
                johnny.say("Isn't that right Albert?",null,2);
            }},
            {time:17.0,run:function(){
                albert.say("-silence-");
            }},
            {time:21.0,run:function(){
                johnny.say("See he agrees.");
                FlxG.sound.play("assets/voices/hallway2/johnny/agrees.ogg");
                nameHeard = true;
                player.canControl = true;
                Global.cutscene = false;
            }},
        ];
        if(customName == "Potted Plant") {
            Event.run(tree);
        }
        else {
            player.say("Hello, Albert.",null,1.5);
            FlxG.sound.play("assets/voices/hallway2/rodger/hello-albert.ogg");

            Event.run([
            {time:1.5,run:function(){
                albert.say("-silence-");
            }},
            ]);
        }
    }
}