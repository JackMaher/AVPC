package objects;
import adventure.*;
import rooms.*;

class Barlift extends Door {
	public function new(x,y){
		super(x,y);
		newRoom=Lift;
		customName = "Lift";
		newPlayerX = 30;
		newPlayerY =10;

	}

}