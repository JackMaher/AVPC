package objects;
import adventure.*;
import rooms.*;

class Penlift extends Door {
	public function new(x,y){
		super(x,y);
		newRoom=Lift;
		newPlayerX = 30;
		newPlayerY =10;
		customName = "Penthouse";
	}

}