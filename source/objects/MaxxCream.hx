package objects;
import adventure.*;
import flixel.util.FlxColor;



class MaxxCream extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Maxx Cream";
		layer=BACK;
	}
		override function look(){
			var player:Player = room.get(Player);

		player.say("Could you please put some clothes on?", FlxColor.ORANGE);


	}
	
}