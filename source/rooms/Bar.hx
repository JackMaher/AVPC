package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.FlxG;
import flixel.util.FlxColor;

class Bar extends Room {
    var nudedone = false;
    override public function create() {
        objects = [
        			new RoomTrigger(163,Loohall,10,10),
        			new PTwink1(69,41),
        			new PTwink2(93,41),
        			new PTwink3(111,42),
        			new Bartender(28,23),                  
                    new Barlift(135,19),
        			new Pool(66,40),
        			new Waterfall(80,30),
        			new Waterfall(102,30),
                    new Block(5),
                    new LBSign(70,13),
        			new Player(140, 21)];
                    //FlxG.timeScale = 2;
                   
    }

    override public function update(d){
        super.update(d);
        if (nudedone){
            return;
        }
        if(Player.clothed == false){
            var twink1:PTwink1 = get(PTwink1);
           var twink3:PTwink3 = get(PTwink3);
            twink1.say("Have some decenty man.");
            twink3.say("*wolf whistle*");
            nudedone = true;
        }
    }


}



class LBSign extends Object {

    public function new(x,y){
        super (x,y);
        customName = "Sign";
        layer=BACK;
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("Luthberge's infamous sign.");
    }
}

