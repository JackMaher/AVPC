package objects;
import adventure.*;
import flixel.util.FlxColor;



class Hal extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Hal 80085";
		layer=FORE;
	}
	
	override function look(){
		say("Hello Dave. Umm I mean Dick.",FlxColor.RED);
	}


}