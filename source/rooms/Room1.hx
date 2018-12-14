package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.FlxG;
import flixel.util.FlxColor;

class Room1 extends Room {
    var nudedone = false;
    override public function create() {
        objects = [
        			new Player(10, 17),
                    new RoomTrigger(133,Hallway,17,36),
                    new RoomTrigger(6,Hallwayleft,114,36),
                    new Catcastle(17,14),
                    new Room1chair(41,24),
                    new Room2chair(93,24),
                    new Albert(70,4),
                    new Room1rug(58,46),];
                    //FlxG.timeScale = 2;
                   
    }


}



class Room1chair extends Object {

    public function new(x,y){
        super (x,y);
        customName = "Johnny's Chair";
        layer=BACK;
        ticks = [
                {word:"LOOK", callback:function(){
                    look(); 
                }},
            ];
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("I don't dare sit in Johnny's chair.");
    }
}
class Room2chair extends Object {

    public function new(x,y){
        super (x,y);
        customName = "Packwood's Chair";
        layer=BACK;
        ticks = [
                {word:"LOOK", callback:function(){
                    look(); 
                }},
            ];
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("My cosy chair, with my personal butt dent on it.");
    }
}


class Room1rug extends Object {

    public function new(x,y){
        super(x,y);
        customName = " ";
        layer=FORE;
    }

}


