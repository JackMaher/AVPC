package objects;
import adventure.*;
import flixel.util.FlxColor;



class Crate extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Crates";
		layer=FORE;
        ticks = [
            {word:"LOOK", callback:function(){
                look(); 
            }},];
	}
	
	override function look(){
		var player:Player = room.get(Player);

		player.say("These crates are blocking the way.");
	}


}