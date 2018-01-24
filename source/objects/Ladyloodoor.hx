package objects;
import adventure.*;
import flixel.util.FlxColor;



class Ladyloodoor extends Object {

	public function new(x,y){
		super (x,y);
		loadGraphic("assets/images/ladyloodoor.png", true,50,32);
        animation.add("closed",[0],0,false);
        animation.add("open",[0,1,2,3,4],10,false);
        animation.play("closed");
		customName = " ";
	}
	override function look(){
		say("Ladies Loo");

	}

	override function use(){

		animation.play("open");

	}
}