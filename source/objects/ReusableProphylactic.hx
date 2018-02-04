package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.util.FlxColor;



class ReusableProphylactic extends Object {
	//var twink1:objects.PTwink1 = room.get(PTwink1);

	public function new(x,y){
		super (x,y);
		customName = "Reusable Prophylactic";
		changeScale(4);
		//updateHitbox();
		layer=FORE;
	}
	override function useOn ( other:Object ) {
	trace(other.type);
	  if(other.name == "Lance") {
	    other.say("Not bloody likely mate");
	  }
	  if(other.type == Player){
	  	other.say("I havent made the animation for that yet",FlxColor.ORANGE);
	  }
	}

	override function look(){
		say("johnnnnny");
	}
}