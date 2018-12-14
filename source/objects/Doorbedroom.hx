package objects;
import adventure.*;
import rooms.*;

class Doorbedroom extends Door {
	public function new(x,y){
		super(x,y);
		newRoom=Bedroom;
		newPlayerX = 33;
		newPlayerY =17;
		customName = "Bedroom";
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