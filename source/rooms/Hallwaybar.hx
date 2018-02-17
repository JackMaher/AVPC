package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.util.FlxColor;
import flixel.FlxG;



class Hallwaybar extends Room {
    var nudedone = false;
    var done = false;
    override public function create() {
        var nudedone = false;
        //scaleFactor = 8;
        //FlxG.timeScale = 2;
        objects = [
            new RoomTrigger(6,Loohall,90,10),
            new Block(109),
            new Nathan(107,11),
            new Hallwaybardoor(45,8),
            new Vase(69,24),
            new Doorman(71,13),
            new StdDeathTxt(17,6),
            new Arcade(18,1),
            new HallwaybarFore(0,0),
            new Player(10,10)];

    }

    override public function update(d){

        if (nudedone){
            return;
        }
        if(Player.clothed == false){
            var twink:Nathan = get(Nathan);
            twink.say("Mmmpph.");
            nudedone = true;
        }


        if(Player.std == true){

            if(done) return;
            done = true;

            var player:Player = get(Player);	
            var nathan:Nathan = get(Nathan);

            var stdDeath = [
            {time:0.0,run:function(){
                player.say("Ow, something itches.", null, 2);
                player.canControl = false;
                Global.cutscene = true;
                trace(Player.std);
            }},

            {time:2.0,run:function(){
                player.walkToObject(Nathan, X, LEFT, function(){
                    player.flipX = true;
                    player.say("This really, really hurts.");
                });
            }},
            {time:6.0,run:function(){
                player.walkTo(player.x - 500, player.y, function(){
                    player.say("Ow.");
                });
            }},

            {time:10.0,run:function(){
                 if (Player.clothed == false){
                     player.say("This itches bad.", null, 2);
                 }
                 else{
                     player.say("I'm feeling really warm");
                     player.customAnimation = "undress";
                     player.afterAnimation (function(){
                         player.customAnimation = null;
                         Player.clothed = false;
                     });
                 }

             }},
            {time:13.0,run:function(){
                 player.say("Oh god, why is that swollen");
             }},
            {time:16.0,run:function(){
                 nathan.say("Mmmpph... Mppph!");
             }},
            {time:19.0,run:function(){
                 player.say("What do you mean Space Clap?");
             }},
            {time:23.0,run:function(){
                 player.customAnimation = "std";
                 player.afterAnimation (function(){
                     player.customAnimation = "stdIdle";
                     player.say("Momma?",FlxColor.LIME, null);
                 });
             }},
            {time:27.0,run:function(){
                 var death:StdDeathTxt = get(StdDeathTxt);	
                 death.activate();
             }},
            ];

            Event.run(stdDeath,false);
        }
        super.update(d);
    }}



class Arcade extends Object {

    public function new(x,y){
        super (x,y);
        customName = "Broken Arcade";
        layer=BACK;
                ticks = [
            {word:"LOOK", callback:function(){
                look(); 
            }},
        ];
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("Broken down arcade that once was deicated to Glide.");
    }
}


class HallwaybarFore extends Object {

    public function new(x,y){
        super (x,y);
        hidden = true;
        layer=FORE;
    }
}

class Vase extends Object {

    public function new(x,y){
        super (x,y);
        customName = "Vase";
        layer=BACK;
                ticks = [
            {word:"LOOK", callback:function(){
                look(); 
            }},
        ];
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("What a colourful selection of... toys.");
    }
}