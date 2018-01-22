package objects;
import adventure.*;
import flixel.util.FlxColor;



class Bartender extends Object {

	public function new(x,y){
		super (x,y);
        loadGraphic("assets/images/bartender.png", true,17,13);
        animation.add("hover",[0,1,2,3],6,true);
        animation.play("hover");
        customName="Bartender";


	}
	override function look(){

		say(" ");


	}
}