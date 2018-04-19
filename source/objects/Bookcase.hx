package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.FlxG;

class Bookcase extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Bookcase";
		layer=BACK;
	}
	override function look(){
		var player:Player = room.get(Player);
		player.say("This Bookcase is full of mucky magazines.");
		//FlxG.sound.play("assets/voices/docking/rodger/bookcase.ogg");
	}
	override function use(){
		var player:Player = room.get(Player);
		player.say("I dont want to get my hands sticky.");
		//FlxG.sound.play("assets/voices/docking/rodger/sticky.ogg");
	}
}
