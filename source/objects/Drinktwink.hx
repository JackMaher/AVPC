package objects;
import adventure.*;
import flixel.util.FlxColor;



class Drinktwink extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Johnny";
        loadGraphic("assets/images/drinktwink.png", true,13,33);
        animation.add("move",[0,1,2,3,3,2,1,0,0,0,0,0,0,0,0,0,0,0,0],8,true);
        animation.play("move");
		layer=FORE;
	}
}