package rooms;

import adventure.*;
import flixel.util.FlxColor;
import objects.*;
import rooms.*;
import flixel.FlxG;


class Cockpit extends Room {
    var nudedone = false;
    override public function create() {
        //scaleFactor = 8;
        objects = [
        			new Player(17,36),
                    new RoomTrigger(6,Hallway,110,36),
                    new Floor1fan(8,21),
                    new Floor1fan(8,35),
                    new Spacestation(63,18),
                    new Controls(42,42),];
                    FlxG.timeScale = 2;
        			 
    }
    public function enter(){
            var player:Player = room.get (Player);
            if(player.intro == false){
                    var interact = [
                    {time:0.0,run:function(){
                        //Global.cutscene = true;
                        player.canControl = false;
                        player.say("Ahhhhhhhhhhhhh.");
                    }},
                    {time:3.0,run:function(){
                        player.say("Ahhhhhhhhhhhhhhh.");
                    }},
                    {time:6.0,run:function(){
                        player.speechColor = FlxColor.RED;
                        player.say("*Ring Ring*");
                        player.speechColor = FlxColor.ORANGE;
                    }},
                    {time:9.0,run:function(){
                        player.say("Ahhhhhhhhhhhhhhh.");
                    }},
                    {time:12.0,run:function(){
                        player.speechColor = FlxColor.RED;
                        player.say("*Ring Ring*");
                        player.speechColor = FlxColor.ORANGE;
                    }},
                    {time:15.0,run:function(){
                        player.say("Ahhhhhhh- Oh Hello?");
                    }},
                    {time:18.0,run:function(){
                        player.speechColor = FlxColor.RED;
                        player.say("Packwood, its me Johnny, I'm nearly finished up at the station.");
                    }},
                    {time:21.0,run:function(){
                        player.say("What are you doing?");
                    }},
                    {time:24.0,run:function(){
                        player.speechColor = FlxColor.ORANGE;
                        player.say("Important space captin stuff.");
                    }},
                    {time:27.0,run:function(){
                        player.speechColor = FlxColor.RED;
                        player.say("You're screaming into the fans again.");
                    }},
                    {time:30.0,run:function(){
                        player.speechColor = FlxColor.ORANGE    ;
                        player.say("Yes I'm screaming into the fans again.");
                    }},
                    {time:33.0,run:function(){
                        player.speechColor = FlxColor.ORANGE    ;
                        player.say("They are the only ones who know my pain.");
                    }},
                    {time:36.0,run:function(){
                        player.speechColor = FlxColor.RED    ;
                        player.say("Well, I assume you got everything ready for when I come back.");
                    }},
                    {time:39.0,run:function(){
                        player.speechColor = FlxColor.ORANGE    ;
                        player.say("Yes I have! ...remind me what was I was supposed todo?");
                    }},
                    {time:42.0,run:function(){
                        player.speechColor = FlxColor.RED    ;
                        player.say("You promised me you'd get everything ready for Christmas.");
                    }},
                    {time:45.0,run:function(){
                        player.speechColor = FlxColor.RED    ;
                        player.say("The music, lights, tree, presents and the cookies.");
                    }},
                    {time:47.0,run:function(){
                        player.speechColor = FlxColor.ORANGE    ;
                        player.say("Ah yes, don't worry thats all sorted out. *CLICK*");
                    }},
                    {time:50.0,run:function(){
                        player.speechColor = FlxColor.ORANGE    ;
                        player.say("Balls, I forgot it was Christmas Eve, I need to get everything on the ship ready.");
                        player.canControl = true;
                        player.intro = true;
                    }},
                    ];
                    Event.run(interact);
                }
    }
}

class Cockfore extends Object {

    public function new(x,y){
        super(x,y);
        customName = " ";
        layer=FORE;
    }

}
