package objects;
import adventure.*;
import flixel.util.FlxColor;



class SexScene extends Object {

	public function new(x,y){
		super (x,y,"sex");
        loadGraphic("assets/images/sex.png", true,50,34);
        animation.add("getIn",[0,1,2],1,false);
        animation.add("sex",[2,3,4,5,6,7,8,9,7,8,9,7,2,3,4,8,9,8,7,6,7,8,9],1,true);
        customName=" ";
        visible = false;
        layer = FORE;


	}
}