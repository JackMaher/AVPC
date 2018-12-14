package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.FlxG;


class Bedroom extends Room {
    var nudedone = false;
    override public function create() {
        //scaleFactor = 8;
        objects = [
        			new Player(10,10),
                    new Doorbedroom1(33,15),
                    new Albertdeco(9,23),
                    new Bed(92,22),
                    new Pictures(96,10),
                    new Window(55,10)];
                    //FlxG.timeScale = 2;
        			 
    }
}


class Bed extends Object {

    public function new(x,y){
        super (x,y);
        customName = "Bed";
        layer=BACK;
        ticks = [
                {word:"LOOK", callback:function(){
                    look(); 
                }},
            ];
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("I should really change the sheets.");
    }
}

class Pictures extends Object {

    public function new(x,y){
        super (x,y);
        customName = "Pictures";
        layer=BACK;
        ticks = [
                {word:"LOOK", callback:function(){
                    look(); 
                }},
            ];
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("Me and Johnny have had a rather... eventful year.");
    }
}

class Window extends Object {

    public function new(x,y){
        super (x,y);
        customName = "Window";
        layer=BACK;
        ticks = [
                {word:"LOOK", callback:function(){
                    look(); 
                }},
            ];
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("Nothing can beat that view.");
    }
}
