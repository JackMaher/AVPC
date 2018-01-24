package objects;
import adventure.*;
import flixel.util.FlxColor;



class Boss extends Object {

	public function new(x,y){
		super (x,y);
		customName = " ";
        loadGraphic("assets/images/boss.png", true,43,25);
        animation.add("hover",[0,1,2,3,5],6,true);
        animation.play("hover");
		layer=FORE;
	}
	override function look(){

		say("PTwink3");


	}
}