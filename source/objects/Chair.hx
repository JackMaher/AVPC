package objects;
import adventure.*;
import flixel.util.FlxColor;



class Chair extends Object {

	public function new(x,y){
		super (x,y);
		hidden = true;
		layer=BACK;
	}
	
}