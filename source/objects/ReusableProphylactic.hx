package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.util.FlxColor;



class ReusableProphylactic extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Reusable Prophylactic";
		changeScale(4);
		//updateHitbox();
		layer=FORE;
	}
	override function useOn ( other:Object ) {
	var player:Player = room.get(Player);





	if(other.name == "Rodger Packwood"){

		if (Player.clothed == false){
			var interact = [
				{time:0.0,run:function(){
					other.say("I'll just slip this on");
				}},
				{time:0.0,run:function(){
					Player.condomOn = true;
					visible = false;
					hidden = true;
				}},
			];	
			Event.run(interact, false);
		}
		else{

			player.say("I dont think I need to add more layers on");

		}

	}






	//trace(other.type);
	  if(other.name == "Lance") {

		var interact = [
			{time:0.0,run:function(){
				other.say("Not bloody likely mate", FlxColor.CYAN, 2);
					}},
			];

	  	player.walkToObject(PTwink1, X, RIGHT, function(){
			player.flipX = false;
			Event.run(interact, false);
		});

	  }
	}

	override function look(){
		say("johnnnnny");
	}

	override public function update(d){
	var player:Player = room.get(Player);
		super.update(d);
		if(Player.condomOn && Player.clothed){
            Player.condomOn = false;
            visible = true;
            hidden = false;
            player.say("I'll put this back in my pocket");
            
        }

	}
}
