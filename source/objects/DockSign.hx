package objects;
import adventure.*;
import flixel.util.FlxColor;



class DockSign extends Object {

	public function new(x,y){
		super (x,y);
		customName = " ";
        loadGraphic("dockingstation", true,36,21);
        animation.add("flash",[0,1,2,3,5,6],10,true);
        animation.play("flash");
		layer=BACK;
	}
}