package objects;
import adventure.*;
import rooms.*;

class Doorbedroom1 extends Door {
	public function new(x,y){
		super(x,y);
		newRoom=Hallway;
		newPlayerX = 40;
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