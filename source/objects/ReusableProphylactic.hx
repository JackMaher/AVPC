package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.util.FlxColor;



class ReusableProphylactic extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Reusable Prophylactic";
		changeScale(4);
		//updateHitbox();
		layer=FORE;
	}
	override function useOn ( other:Object ) {
	var player:Player = room.get(Player);


	trace(other.type);
	  if(other.name == "Lance") {

		var interact = [
			{time:0.0,run:function(){
				other.say("Not bloody likely mate", FlxColor.CYAN, 2);
					}},
			];

	  	player.walkToObject(PTwink1, X, RIGHT, function(){
			player.flipX = false;
			Event.run(interact, false);
		});

	  }
	}

	override function look(){
		say("johnnnnny");
	}
}