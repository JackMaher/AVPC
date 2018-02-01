package objects;
import adventure.*;
import rooms.*;
import flixel.util.FlxColor;

class H1Door extends Door {
	public function new(x,y){
		super(x,y);
		//color = FlxColor.RED;
		newRoom=Lift;
		newPlayerX = 15;
		newPlayerY =10;
	}

}