package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.FlxG;

class Bar extends Room {
    override public function create() {
        objects = [
        			new RoomTrigger(163,Loohall,10,10),
        			new PTwink1(69,40),
        			new PTwink2(93,40),
        			new PTwink3(111,41),
        			new Bartender(28,23),
                    
                    new Barlift(135,19),
        			new Pool(66,40),
        			new Waterfall(80,30),
        			new Waterfall(102,30),
                    new Block(5),
        			new Player(140, 21)];
                   
    }




}