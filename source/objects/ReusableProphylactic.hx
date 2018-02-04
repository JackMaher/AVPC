package objects;
import adventure.*;
import flixel.util.FlxColor;



class ReusableProphylactic extends Object {
	//var twink1:objects.PTwink1 = room.get(PTwink1);

	public function new(x,y){
		super (x,y);
		customName = "Reusable Prophylactic";
		//changeScale(4);
		//updateHitbox();
		layer=FORE;
	}
	override function useOn ( other:Object ) {
	  if(other.name == "PTwink1") {
	    other.say("test");
	  }
	}

	override function look(){
		say("johnnnnny");
	}
}