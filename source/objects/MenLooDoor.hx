package objects;
import adventure.*;
import rooms.*;

class MenLooDoor extends Door {
	public function new(x,y){
		super(x,y);
		newRoom=Bathroom;
		newPlayerX = 10;
		newPlayerY =10;
		customName = "Male";
	}

	override public function use(){
		super.use();
		Global.currentRoom.get(Player).flipX = true;
	}

}