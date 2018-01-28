package objects;
import adventure.*;
import flixel.util.FlxColor;



class Snack extends Object {

	public function new(x,y){
		super (x,y);
		customName = " ";
		loadGraphic("assets/images/snack.png", true,20,42);
		layer=BACK;
	}
	
}