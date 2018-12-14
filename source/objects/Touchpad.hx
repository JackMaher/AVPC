package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.FlxG;

class Touchpad extends Object {

    var taken : Bool = false;

    public function new(x,y){
        super (x,y);
        customName = "Touchpad";
        loadGraphic("assets/images/touchpad.png", true,5,9);
        layer=BACK;

        ticks = [
        {word:"USE", callback:use},
        {word:"LOOK",callback:look}
        ];
    }

    override function use(){
        var player:Player = room.get(Player);
        if (taken == false){
        var interact = [
            {time:0.0,run:function(){
                player.say("I'll just set the Feeder to make some Christmas Cookies.");
            }},
            {time:3.0,run:function(){
                say ("Christmas Cookies Entered, please wait 5-999999 minutes.");
            }},
            {time:6.0,run:function(){
                player.say ("I'll just leave this running while I finish up everything else.");
                taken = true;
                player.CookieQuest = true;
            }},
            ];
            Event.run(interact);
        }
        else{
            player.say("I think its working?");
        }
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("Controls for The Feeder");
    }


}
