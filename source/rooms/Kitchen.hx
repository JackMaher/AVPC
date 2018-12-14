package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.FlxG;


class Kitchen extends Room {
    var nudedone = false;
    override public function create() {
        //scaleFactor = 8;
        objects = [
        			new Player(10,10),
                    new Doorkitchen1(156,15),
                    new Thefeeder(85,0),
                    new Table(94,33),
                    new Curtin(21,4),
                    new Krug(11,46),
                    new Tea(38,23),
                    new Touchpad(86,24),
                    new Plate(16,24),
                    new Alcohol(62,21),
                    new Kcupboard(20,34)];
                    
        			 
    }
}
class Thefeeder extends Object {

    public function new(x,y){
        super (x,y);
        customName = "The Feeder";
        layer=BACK;
        ticks = [
                {word:"LOOK", callback:function(){
                    look(); 
                }},
            ];
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("I wonder if I can get the Feeder to make a Christmas dinner?");
    }
}
class Table extends Object {

    public function new(x,y){
        super (x,y);
        customName = "Table";
        layer=BACK;
        ticks = [
                {word:"LOOK", callback:function(){
                    look(); 
                }},
            ];
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("This table cloth is stain with more than just food.");
    }
}
class Krug extends Object {

    public function new(x,y){
        super (x,y);
        customName = " ";
        layer=FORE;
        ticks = [ ];
    }
}
class Tea extends Object {

    public function new(x,y){
        super (x,y);
        customName = "Kettle";
        layer=BACK;
        ticks = [
                {word:"LOOK", callback:function(){
                    look(); 
                }},
            ];
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("I could die for a cupper.");
    }
}
class Plate extends Object {

    public function new(x,y){
        super (x,y);
        customName = "Plates";
        layer=BACK;
        ticks = [
                {word:"LOOK", callback:function(){
                    look(); 
                }},
            ];
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("These could do with a clean.");
    }
}

class Curtin extends Object {

    public function new(x,y){
        super (x,y);
        customName = "Curtins";
        layer=BACK;
        ticks = [
                {word:"LOOK", callback:function(){
                    look(); 
                }},
            ];
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("Heaven knows why we got country kitchen package.");
    }
}
