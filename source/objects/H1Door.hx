package objects;
import adventure.*;
import rooms.*;

class H1Door extends Door {
	public function new(x,y){
		super(x,y);
		newRoom=Lift;
		newPlayerX = 15;
		newPlayerY =10;
	}

}