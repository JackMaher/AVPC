package objects;
import adventure.*;
import flixel.util.FlxColor;

class Rodgerseat extends Object {
	public var customAnimation:String;

    public function new(x,y){
        super (x,y);
        customName = "Rodger Packwood";
        loadGraphic("assets/images/rodgerseat.png", true,22,26);
        animation.add("still",[0],0,false);
        animation.add("empty",[7],0,false);
        animation.add("teley",[0,1,2,3,4,5,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7],6,false);
        animation.add("teleyin",[7,7,7,7,7,7,7,7,7,6,5,4,3,2,1,0],6,false);
        animation.play("still");
        layer=FORE;
        speechColor = FlxColor.ORANGE;
    }
}