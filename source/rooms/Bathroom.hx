package rooms;

import adventure.*;
import objects.*;
import rooms.*;

import flixel.FlxG;

class Bathroom extends Room {
    override public function create() {
        //scaleFactor = 8;
        objects = [
        			new OccupiedToilet(87,8),
        			new GloryHole(86,26),
					new RoomTrigger(0,Loohall,30,10),
					new Bog(70,21),
        			new Player(10,10)];
    }




}