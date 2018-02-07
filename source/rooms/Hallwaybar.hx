package rooms;

import adventure.*;
import objects.*;
import rooms.*;

class Hallwaybar extends Room {
    override public function create() {
        //scaleFactor = 8;
        objects = [
					new RoomTrigger(6,Loohall,90,10),
					new Block(109),
					new Nathan(107,11),
					new Hallwaybardoor(45,8),
					new Doorman(71,13),
        			new Player(10,10)];
    }

    override public function update(d){
 		
		   if(Player.std == true){
		   var player:Player = get(Player);	
		   
		    var stdDeath = [
				{time:2.0,run:function(){
					player.say("Ow, something itches", null, 2);
					trace(Player.std);
				}},
    		];
    		Event.run(stdDeath);
    }
super.update(d);
}}