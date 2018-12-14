package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.util.FlxColor;



class LightsInv extends Object {

	public function new(x,y){
		super (x,y);
		visible = true;
		customName = "Christmas Lights";
		changeScale(4);
		layer=FORE;

	}
	override function useOn ( other:Object ) {
	var player:Player = room.get(Player);

		if(other.name == "Unfestive Albert"){

		var interact = [
			{time:0.0,run:function(){
				player.say("Lets Deck these halls boiiiiiiiiiiiiiiii");
			}},
			{time:3.0,run:function(){
				visible = true;
				room.addObject(new LightsRoom(0,0));
			}},
			];
			Event.run(interact);
			
		}
	}

	override function look(){
		say("How festive");
	}
}
