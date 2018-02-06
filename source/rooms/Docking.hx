package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.util.FlxColor;

class Docking extends Room {
    override public function create() {
       // scaleFactor = 8;
        objects = [
                                                new Space(49,13),
                    //new Dockwindow(49,13),
                    new RoomTrigger(6,Hallway2,110,36),
                    //new Dockdoor(93,9),
                    //new Dockdoorfront(93,9),
                    new Block(151),
        			new Player(123,37),
                    new TwinkTrigger(20),
                    new Tele(105,28),
                    new SitTwink2(50,41),
                    new SitTwink(83,41),
                    new Hal(75,14),
                    new HalTrigger(88),];
    }



}

class HalTrigger extends Trigger {

    var done = false;
    function trigger (){
        if(done) return;
        done = true;

        var hal:Hal = room.get(Hal);
        hal.say("Hello Packwood", FlxColor.RED);
        hal.say("The Captin is waiting for you in his Penthouse", FlxColor.RED);
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
                twink1.say("He doesnt even go here", FlxColor.BROWN, 3);
            }},
            {time:1.0,run:function(){
                twink2.say("I know right", 0xffFFC300,2);
            }},
            {time:3.0,run:function(){
                player.say("Excuse me?", FlxColor.ORANGE,3);
            }},
            {time:4.0,run:function(){
                twink1.say("Nothing, nothing.", FlxColor.BROWN,2);
            }},
            {time:6.0,run:function(){
                twink1.say("Skank.", FlxColor.BROWN,1);
            }},
            {time:7.0,run:function(){
                player.canControl = true;
            }}
            ];



        player.flipX = true;
        Event.run(interact, false);
        player.canControl = false;
    }

}