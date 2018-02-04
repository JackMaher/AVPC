package objects;
import adventure.*;
import flixel.util.FlxColor;



class Sofa extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Sofa";
        loadGraphic("assets/images/sofa.png", true,38,19);
        animation.add("flash",[0,1,2,3],4,true);
        animation.play("flash");
		layer=BACK;
	}
}