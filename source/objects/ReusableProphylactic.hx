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



	if(other.name == "Luthberge"){
		other.say("Maybe when you get me Lena I'll reward you.");
	}

	if(other.name == "Bookcase"){
		player.say("I dont think I should make this bookcase anymore sticky.");
	}
	if(other.name=="Lift"){
		other.say("I'm saving myself for Luthberge.");
	}
	if(other.name=="Bruce"){
		if(Player.poppersComplete == true){
			other.say("*SNIFF* You've turn me down once... twice already.");
		}
		else{
			other.say("Ew, just ew.");
			}
	}

	if(other.name == "Gayvin"){
		other.say("Yeah... No.");
	}
	if(other.name == "Kurt"){
		other.say("You and me? Really? Ha.");
	}
	if(other.name == "Guy"){
		player.say("Best leave him.");
	}


	if(other.name == "Adam"){
		other.say("Maybe you should have offered that to your parents instead.");
	}

	if(other.name == "Steve"){
	var twink:SitTwink = room.get(SitTwink);
		var interact = [
			{time:0.0,run:function(){
				other.say("Ummm... arrr...");
			}},
			{time:3.0,run:function(){
				twink.say("Get away from him!");
			}},
			];
			Event.run(interact);

		}	
	
	if(other.name == "Johnny"){
		other.say("Well, maybe after a drink.");
	}

	if(other.name == "Nathan"){
		other.say("Mhhhppp.");
	}


	if(other.name == "Rodger Packwood"){

		if (Player.clothed == false){
			var interact = [
				{time:0.0,run:function(){
					other.say("I'll just slip this on.");
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

			player.say("I dont think I need to add more layers on.");

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
