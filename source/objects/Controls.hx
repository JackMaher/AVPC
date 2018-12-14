package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.FlxG;



class Controls extends Object {

    public function new(x,y){
        super (x,y);
        customName = "Ships Console";
        layer=BACK;
        ticks = [
                {word:"LOOK", callback:function(){
                    look(); 
                }},
                {word:"USE", callback:function(){
                    use(); 
                }},
            ];
    }
    override function look(){
        var player:Player = room.get(Player);
            var interact = [
            {time:0.0,run:function(){
                player.say("Hmm, now how do I get you to play music?");
            }},
            {time:3.0,run:function(){
                say("Please insert CD.");
            }},
            {time:6.0,run:function(){
                player.say("Ah yes, but where did Johnny leave the 'Festive' CD?");
            }},
            ];
            Event.run(interact);
    }
    override function use(){
        var player:Player = room.get(Player);
        player.say("Haven't got anything to put in it.");
    }
}