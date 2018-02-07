package objects;
import adventure.*;
import flixel.util.FlxColor;



class Poptwink1 extends Object {

	public function new(x,y){
		super (x,y);
		speechColor = 0xfff1eada;
		customName = "Guy";
		layer=BACK;
	}

	override function look(){
		var player:Player = room.get(Player);

		player.say("They seem to be having a sniffing contest.");
		say("*SNIFF* Thats the good stuff.");


	}
}