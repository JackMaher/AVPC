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
        animation.add("teley",[0,1,2,3,4,5,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7],3,false);
        animation.play("still");
        layer=FORE;
        speechColor = FlxColor.ORANGE;
    }
}