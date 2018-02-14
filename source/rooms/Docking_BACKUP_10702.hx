package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.util.FlxColor;
import flixel.FlxG;

class Docking extends Room {

    var nudedone = false;
    var introdone = false;

    override public function create() {
        objects = [
                    new Space(49,13),
                    new RoomTrigger(6,Hallway2,110,36),
                    new Block(134),
        			new Player(118,37),
                    new TwinkTrigger(20),
                    new SitTwink2(50,41),
                    new SitTwink(83,41),
                    new Hal(75,14),
                    new Bookcase(19,24),
                    new Tele(114,14)
                    ];
<<<<<<< HEAD
=======
                    //FlxG.timeScale = 2;
>>>>>>> 6b43c5c0e577bb28c2062a279f24eeadc16b6827
        Global.fader.alpha = 1;
        Global.fader.fadeIn();

    }

    override public function update(d){
        super.update(d);
        if (nudedone){
            return;
        }
        if(Player.clothed == false){
            var twink:SitTwink = get(SitTwink);
            twink.say("He dosen't even have one desirable feture.");
            nudedone = true;
        }

        if(introdone) return;
        introdone = true;

        var player:Player = room.get(Player);
        var twink:SitTwink = get(SitTwink);
        var hal:Hal = get(Hal);

        var intro = [
            {time:0.0,run:function(){
                Global.canInteract = false;
                player.canControl = false;

                 player.customAnimation = "teleyIn";
                 player.afterAnimation (function(){
                     player.customAnimation = null;
                 });

            }},
            {time:1.0,run:function(){

                player.say("OWWWWWWWWWWWWWW", null, 3);

            }},

            {time:4.0,run:function(){
                twink.say("Smells like Lutheberge has called in the riff-raff.");
            }},
            {time:8.0,run:function(){
                hal.say("Hello Packwood, the Captin is waiting for you in his Penthouse.", FlxColor.RED);
            }},

            {time:9.0,run:function(){
                Global.canInteract = true;
                player.canControl = true;
            }},

        ];
        Event.run(intro, false);

    }



}

class TwinkTrigger extends Trigger{
    var done = false;

    function trigger (){
        if(done) return;
        done = true;
        var player:Player = room.get(Player);
        var twink1:SitTwink = room.get(SitTwink);
        var twink2:SitTwink2 = room.get(SitTwink2);

        var interact = [
            {time:0.0,run:function(){
                Global.canInteract = false;
                twink1.say("He doesnt even go here.", null, 3);
            }},
            {time:1.0,run:function(){
                twink2.say("I know right.", null,2);
            }},
            {time:3.0,run:function(){
                player.say("Excuse me?", null,3);
            }},
            {time:4.0,run:function(){
                twink1.say("Nothing, nothing.", null,2);
            }},
            {time:6.0,run:function(){
                twink1.say("Skank.", null,1);
            }},
            {time:7.0,run:function(){
                player.canControl = true;
                Global.canInteract = true;
            }}
            ];



        player.flipX = true;
        Event.run(interact, false);
        player.canControl = false;
    }

}

class Tele extends Object {

    public function new(x,y){
        super (x,y);
        speechColor = FlxColor.RED;
        customName = "Teleporter";
        layer=BACK;
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("The only way on and off this ship.");
    }

    override function use(){
        var player:Player = room.get(Player);
        if(Player.complete == true){
            var outTro = [
            {time:0.0,run:function(){
                player.say("Here goes nothing.");
            }},
            {time:3.0,run:function(){
            player.customAnimation = "teleyOut";
                player.afterAnimation (function(){
                    game.switchRoom(EndCutscene);
                });
            }}
            ];
            Event.run(outTro, false);

        }
            else{
                say("ACCESS DENINED");
            }

    }
}
