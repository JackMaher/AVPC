package objects;
import adventure.*;
import flixel.util.FlxColor;



class Bog extends Object {

	var conDone:Bool = false;

	public function new(x,y){
		super (x,y);
		customName = "Bog";
		layer=BACK;
		ticks = [
	            {word:"USE", callback:function(){
	                look(); 
	            }},
	            {word:"SEARCH", callback:function(){
	                use(); 
	            }},
            ];
	}
	
	override function use(){
		if (conDone == true){
			return;
		}
		var player:Player = room.get(Player);
		conDone = true;
						ticks = [
	            {word:"USE", callback:function(){
	                look(); 
	            }}
            ];
		//player.say("sure why not");

		var interact = [
		{time:0.0,run:function(){
			player.say("What has my life become?");
			player.customAnimation="standup";
			player.afterAnimation(function(){
				player.customAnimation = null;
				Global.inventory.add(new ReusableProphylactic(-1000,20) );
			});
		}}

		];

		player.walkTo(x - 50,player.y,function(){
			player.flipX = true;
			player.customAnimation="kneel";

			player.afterAnimation( function(){
				player.customAnimation="kneeled";
				Event.run(interact, false);
			});

		});

	}

	override function look(){
		var player:Player = room.get(Player);
		player.say("I dont need to go.");
	}


}