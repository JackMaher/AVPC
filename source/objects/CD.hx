package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.util.FlxColor;
import flixel.FlxG;



class CD extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Festive CD";
		changeScale(4);
		layer=FORE;

	}
	override function useOn ( other:Object ) {
	var player:Player = room.get(Player);

		if(other.name == "Ships Console"){

		var interact = [
			{time:0.0,run:function(){
				player.say("Lets get the music on.");
			}},
			{time:3.0,run:function(){
				Global.inventory.remove(this);
			}},
			];
			Event.run(interact);
			
		}
	}

	override function look(){
		say("Worth the wait.");
	}
}
