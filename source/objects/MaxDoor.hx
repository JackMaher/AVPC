package objects;
import adventure.*;
import rooms.*;
import flixel.util.FlxColor;

class MaxDoor extends Door {
	public function new(x,y){
		super(x,y,"door");
		//color = FlxColor.RED;
		newRoom=Hallwaybar;
		newPlayerX = 50;
		newPlayerY =10;
	}

}