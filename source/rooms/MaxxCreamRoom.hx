package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.FlxG;

class MaxxCreamRoom extends Room {
    override public function create() {
       // scaleFactor = 8;
        objects = [
					//new RoomTrigger(6,Bar,130,21),
					new MaxxCream(85,10),
					new MaxDoor(21,8),
					new Block(146),
					new Block(6),
					new Camera(11,1),
					new MaxLight(62,2),
					new CutTrigger(145),
					new MaxTrigger(20),
        			new Player(10,10),
        			new MaxBar(138,16)];

        			
        			var player:Player = get(Player);
        			player.flipX = true;
        			FlxG.timeScale = 2;
    }


}

class MaxTrigger extends Trigger{
	var done:Bool = false;

	function trigger(){
		if (done){
			return;
		}
		if(Player.clothed == false){
			var max:MaxxCream = room.get(MaxxCream);
			max.say("You're an eager one.");
			done = true;
		}
	}


}


class CutTrigger extends Trigger{
	var clothesLine:Bool = false;
	function trigger(){
		var max:MaxxCream = room.get(MaxxCream);

		if (MaxxCream.cutDone == false){
			return;
		}

		if(Player.clothed == true){
			if (clothesLine == false){max.say("I'm not a over the jeans sort of gal");}
			clothesLine = true;
			return;
		}


		var player:Player = room.get(Player);
		player.canControl = false;
		Global.canInteract = false;
		var bar:MaxBar = room.get(MaxBar);
		bar.visible = true;
	}
}