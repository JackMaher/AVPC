package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.text.FlxText;




class StdDeathTxt extends Object {

	public function new(x,y){
		super (x,y);
		customName = " ";
		loadGraphic("assets/images/stddeathtxt.png", true,85,32);
		layer=FORE;
		visible = false;

		var text = new FlxText(0,0,500);
		text.text = "HELLLLLLO";
		text.setFormat(null, 20, FlxColor.GREEN,CENTER);
		this.stamp(text);
	}
}