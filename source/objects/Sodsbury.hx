package objects;
import adventure.*;
import flixel.util.FlxColor;



class Sodsbury extends Object {

	public function new(x,y){
		super (x,y);
		layer = FORE;
        loadGraphic("assets/images/sodsbury.png", true,10,14);
        animation.add("hover",[0,1,2,3],6,true);
        animation.play("hover");
        speechColor = FlxColor.PINK;
        customName="Sodsbury";
	}
	
}