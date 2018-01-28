package objects;
import adventure.*;
import flixel.util.FlxColor;



class Ladyloo extends Object {

	public function new(x,y){
		super (x,y);
		customName = " ";
        loadGraphic("assets/images/ladyloo.png", true,10,14);
        animation.add("flash",[0,1,2,3,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19],10,true);
        animation.play("flash");
		layer=BACK;
	}
}