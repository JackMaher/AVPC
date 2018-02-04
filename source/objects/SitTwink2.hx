package objects;
import adventure.*;
import flixel.util.FlxColor;



class SitTwink2 extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Steve";
        loadGraphic("assets/images/sittwink2.png", true,21,26);
        animation.add("move",[0,1,2,3,4,4,4,4,4,4,4,4,4,4],8,true);
        animation.play("move");
		layer=BACK;
	}
}