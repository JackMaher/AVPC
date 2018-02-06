package objects;
import adventure.*;
import flixel.util.FlxColor;



class Camera extends Object {

	public function new(x,y){
		super (x,y);
		customName = "CCTV";
		speechColor = FlxColor.RED;
		layer=FORE;
	}
	
}