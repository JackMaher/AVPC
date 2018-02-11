package objects;
import adventure.*;
import flixel.util.FlxColor;



class Dockwindow extends Object {

	public function new(x,y){
		super (x,y);
		hidden = true;
        //loadGraphic("assets/images/space.png", true,57,57);
        //animation.add("flash",[0,1,2,3],5,true);
        //animation.play("flash");
		layer=BACK;
	}
}