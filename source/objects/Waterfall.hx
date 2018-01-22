package objects;
import adventure.*;
import flixel.util.FlxColor;



class Waterfall extends Object {

	public function new(x,y){
		super (x,y);
        loadGraphic("assets/images/waterfall.png", true,4,21);
        animation.add("fall",[5,4,3,2,1,0],6,true);
        animation.play("fall");
        customName=" ";


	}
	override function look(){

		say(" ");


	}
}