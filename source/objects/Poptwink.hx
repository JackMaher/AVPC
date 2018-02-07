package objects;
import adventure.*;
import flixel.util.FlxColor;



class Poptwink extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Gayvin";
		speechColor = 0xffff8fa6;
		layer=BACK;
	}
	override function look(){
		var player:Player = room.get(Player);

		say("*SNIFF* Riding that wave man.");


	}
}