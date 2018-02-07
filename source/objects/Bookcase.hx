package objects;
import adventure.*;
import flixel.util.FlxColor;



class Bookcase extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Bookcase";
		layer=BACK;
	}
	override function look(){
		var player:Player = room.get(Player);
				player.say("Bookcase seems full of Mucky magazine.");
	}
	override function use(){
		var player:Player = room.get(Player);
				player.say("I dont fancy getting my hands sticky.");
	}
}