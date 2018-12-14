package objects;
import adventure.*;
import rooms.*;

class Doorkitchen1 extends Door {
	public function new(x,y){
		super(x,y);
		newRoom=Hallwayleft;
		newPlayerX = 80;
		newPlayerY =36;
		customName = "Hallway";
		ticks = [
	            {word:"ENTER", callback:function(){
	                use(); 
	            }},
            ];
	}

	override public function use(){
		super.use();
		Global.currentRoom.get(Player).flipX = true;
	}

}