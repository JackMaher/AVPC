package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.util.FlxColor;



class Baubles extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Baubles";
		changeScale(4);
		layer=FORE;

	}
	override function useOn ( other:Object ) {
	var player:Player = room.get(Player);

		if(other.name == "Unfestive Albert"){

		var interact = [
			{time:0.0,run:function(){
				player.say("Here, have a bit of festive cheer Albert.");
			}},
			{time:3.0,run:function(){
				other.animation.play("flash");
				other.customName = "Festive Albert";
				other.say("-Festive Silence-");
				Global.inventory.remove(this);
				player.TreeQuest = true;
				cast(other,Albert).festive = true;
			}},
			];
			Event.run(interact);
			
		}
	}

	override function look(){
		say("How festive");
	}
}
