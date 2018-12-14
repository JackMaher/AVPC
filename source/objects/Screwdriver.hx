package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.util.FlxColor;



class Screwdriver extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Screwdriver";
		changeScale(4);
		layer=FORE;

	}
	override function useOn ( other:Object ) {
	var player:Player = room.get(Player);

		if(other.name == "Cat's Castle"){

		var interact = [
			{time:0.0,run:function(){
				player.say("Here, hopefully end their protest now.");
			}},
			{time:3.0,run:function(){
				other.animation.play("built");
				Global.inventory.remove(this);
				Catcastle.built = true;
			}},
			];
			Event.run(interact);
			
		}
	}

	override function look(){
		say("Worth the wait.");
	}
}
