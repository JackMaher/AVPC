package objects;
import adventure.*;
import rooms.*;

class Doorkitchen extends Door {
	public function new(x,y){
		super(x,y);
		newRoom=Kitchen;
		newPlayerX = 150;
		newPlayerY =17;
		customName = "Kitchen";
		ticks = [
	            {word:"ENTER", callback:function(){
	                use(); 
	            }},
            ];
	}

	override public function use(){
		super.use();
		Global.currentRoom.get(Player).flipX = false;
	}

}