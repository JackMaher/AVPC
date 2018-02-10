package objects;
import adventure.*;
import flixel.util.FlxColor;



class Spacestation extends Object {
    public function new(x,y){
        super (x,y);
        layer = FORE;
        loadGraphic("assets/images/spacestation.png",true, 24,24);
        animation.add("hover",[0,1,2,3,4,5],4,true);
        animation.play("hover");
        speechColor = FlxColor.PINK;
        customName="Spaceport";
    }
    
}