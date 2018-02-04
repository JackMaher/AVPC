package objects;
import adventure.*;
import flixel.util.FlxColor;



class Tele extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Teleporter";
        loadGraphic("assets/images/tele.png", true,47,9);
        animation.add("flash",[0,1,2,3,4],5,true);
        animation.play("flash");
		layer=BACK;
	}
}