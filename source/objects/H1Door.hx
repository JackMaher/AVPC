package objects;
import adventure.*;
import rooms.*;
import flixel.util.FlxColor;

class H1Door extends Door {
	public function new(x,y){
		super(x,y,"door");
		newRoom=Lift;
		customName = "Lift";
		hideName = false;
		newPlayerX = 15;
		newPlayerY =10;
	}

}