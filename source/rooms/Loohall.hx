package rooms;

import adventure.*;
import objects.*;
import rooms.*;

class Loohall extends Room {
    override public function create() {
        //scaleFactor = 8;
        objects = [
					new RoomTrigger(6,Bar,130,21),
                    new Loodeath(17,6),
					new RoomTrigger(107,Hallwaybar,10,10),
					new MenLooDoor(24,8),
					new Ladyloo(66,10),
					new Ladyloodoor(62,8),
        			new Player(10,10)];
    }


    override public function update(d){
    	super.update(d);
    	var player:Player = get(Player);
    	var loo:Ladyloodoor = get(Ladyloodoor);
    	if(Ladyloodoor.open == true){
    		Global.canInteract = false;

    		if(player.canControl) {
		    	if(player.x + player.width/2  - player.offset.x < loo.x+loo.width/2){
		    		player.x = player.x+550 * d;

		    	}

		    	else if(player.x + player.width/2  - player.offset.x > loo.x+loo.width/2){
		    		player.x = player.x-550 * d;
		    	}
		    }

    		if(Math.abs(player.x + player.width/2 - loo.x  - player.offset.x - loo.width/2) < 2000*d) {
    			player.canControl = false;
    			player.velocity.x = 0;
    			player.width = player.frameWidth;
    			player.height = player.frameHeight;
    			player.centerOrigin();
    			player.scale.set(player.scale.x * 0.99, player.scale.y * 0.99);
    			player.angle+=0.5;
    			player.y = loo.y + 15 * room.scaleFactor;
    			player.x = loo.x + loo.width/2 - player.width/2 + player.offset.x;

                var wait = [
                {time:6.0,run:function(){
                var death:Loodeath = get(Loodeath);  
                 death.activate();
                }}
                ];
                Event.run(wait);
    		}
	    }
    }


}