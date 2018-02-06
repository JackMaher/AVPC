package objects;
import adventure.*;
import flixel.util.FlxColor;

using flixel.tweens.FlxTween;
import flixel.tweens.*;


class MaxBar extends Object {

	public function new(x,y){
		super (x,y);
		layer=FORE;
		visible = false;
		scale.set(scale.x*0.01,scale.y*0.01);
	}


}