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
        			new Player(33,17),
                    new Doorbedroom1(28,15),
                    new Albertdeco(70,34),
                    new Underthebed(99,45),
                    new Bed(83,22),
                    new Pictures(50,10),
                    new Window(82,8),
                    new Twinkbot(11,14)];
                    FlxG.timeScale = 2;
        			 
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
