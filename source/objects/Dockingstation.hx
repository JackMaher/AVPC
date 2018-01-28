package objects;
import adventure.*;
import flixel.util.FlxColor;



class Dockingstation extends Object {

	public function new(x,y){
		super (x,y);
		customName = " ";
        loadGraphic("assets/images/dockingstation.png", true,36,21);
        animation.add("flash",[0,1,2,3,5,6],5,true);
        animation.play("flash");
		layer=BACK;
		//Effects.makeGlow(this,FlxColor.ORANGE);
	}
}