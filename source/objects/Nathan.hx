package objects;
import adventure.*;
import flixel.util.FlxColor;



class Nathan extends Object {


	public function new(x,y){
		super (x,y);
		customName = "Nathan";
	}

	override function use(){


		var player:Player = room.get(Player);

		var interact = [
			{time:0.0,run:function(){

				say("test", FlxColor.GREEN, 4);
			}},
			{time:2.0,run:function(){
				player.say("test", FlxColor.WHITE,4);
			}},		
		];
		
		player.walkToObject(Nathan, X, LEFT, function(){
			player.flipX = true;
			Event.run(interact);
			});

		};

	
	override function look(){
		var player:Player = room.get(Player);
		player.say("How does he breath with that covering his mouth?");
	}


}