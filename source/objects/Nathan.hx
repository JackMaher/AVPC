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
		var roomX = room.getX(79);
		var roomY = room.getY(16);


		var interact = [
			{time:0.0,run:function(){

				player.say("Hey! Are you OK?", FlxColor.ORANGE, 2);
			}},
			{time:2.0,run:function(){
				say("Mmmph.... mmmph", FlxColor.GREEN,3);
			}},		
		];
		
		player.walkTo(roomX, roomY, function(){
			player.flipX = true;
			Event.run(interact);
			});

		};

	
	override function look(){
		var player:Player = room.get(Player);
		player.say("How does he breath with that covering his mouth?");
	}


}