package objects;
import adventure.*;
import flixel.util.FlxColor;



class SitTwink extends Object {

	public function new(x,y){
		super (x,y);
		customName = " ";
        loadGraphic("assets/images/sittwink.png", true,21,26);
        animation.add("move",[0,1,2,3,4,4,4,4,4],5,true);
        animation.play("move");
		layer=BACK;
	}
}