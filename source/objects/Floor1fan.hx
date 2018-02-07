package objects;
import adventure.*;
import flixel.util.FlxColor;



class Floor1fan extends Object {

	public function new(x,y){
		super (x,y);
        loadGraphic("assets/images/floor1fan.png", true,12,12);
        animation.add("spin",[0,1,2,3],16,true);
        animation.play("spin");
		customName = " ";
		layer=BACK;
	}
}