package objects;
import adventure.*;
import rooms.*;

class H1Door extends Door {
	public function new(x,y){
		super(x,y);
		newRoom=Bar;
		newPlayerX = 124;
		newPlayerY =21;
	}

}