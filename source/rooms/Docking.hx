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
                    new Block(151),
        			new Player(123,37),
                    new TwinkTrigger(20),
                    new Tele(105,28),
                    new SitTwink2(50,41),
                    new SitTwink(83,41),
                    new Hal(75,14),
                    new Bookcase(18,27),
                    new HalTrigger(88),];
                    FlxG.timeScale = 2;
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

        var intro = [
            {time:0.0,run:function(){
                Global.canInteract = false;

                 player.customAnimation = "teleyIn";
                 player.afterAnimation (function(){
                     player.customAnimation = null;
                 });

            }},
            {time:1.0,run:function(){

                player.say("OWWWWWWWWWWWWWW", null, 3);

            }},
            
            {time:4.0,run:function(){
                twink.say("Looks like Lutheberge has called in the riff-raff.");
            }},

            {time:4.0,run:function(){
                Global.canInteract = true;
            }},

        ];
        Event.run(intro, false);

    }



}

class HalTrigger extends Trigger {

    var done = false;
    function trigger (){
        if(done) return;
        done = true;

        var hal:Hal = room.get(Hal);
        hal.say("Hello Packwood.", FlxColor.RED);
        hal.say("The Captin is waiting for you in his Penthouse.", FlxColor.RED);
    }

}

class TwinkTrigger extends Trigger{
    var done = false;

    function trigger (){
        if(done) return;
        done = true;
        var player:Player = room.get(Player);
        var twink1:SitTwink = room.get(SitTwink);
        var twink2:SitTwink = room.get(SitTwink2);

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