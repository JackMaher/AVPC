package objects;
import adventure.*;
import flixel.util.FlxColor;



class PTwink2 extends Object {
			var floatTime:Float = 1000;
		var done = false;

	public function new(x,y){
		super (x,y);
		customName = "Bruce";
		layer=FORE;
			ticks = [
				{word:"LOOK", callback:function(){
	                look(); 
	            }},
	            {word:"TALK", callback:function(){
	                use(); 
	            }},
            ];
	}
	override function look(){
		var player:Player = room.get(Player);
		var interact = [
			{time:0.0,run:function(){
				player.say("Sounds like hes got a runny nose.");
			}},
			{time:3.0,run:function(){
				say("-SNIFF-");
			}},
			];
			Event.run(interact);

	}

	override function use(){
		if(done) return;
        done = true;
		var player:Player = room.get(Player);
		var interact = [
			{time:0.0,run:function(){
				player.say("Hey do yo...");
			}},
			{time:3.0,run:function(){
				say("-SNIFF- no.");
			}},
			{time:6.0,run:function(){
				player.say("do... do you kno...");
			}},
			{time:9.0,run:function(){
				say("NO! -SNIFF-");
				done = false;
				player.canControl = true;
			}},

			];
		player.walkToObject(PTwink2, X, RIGHT, function(){
			player.canControl = false;
			player.flipX = false;
			Event.run(interact, false);
		});

	}


	override public function update(d) {
		super.update(d);
		offset.y -= Math.sin(floatTime)*room.scaleFactor/2;
		floatTime += d*1.2;
		floatTime %= Math.PI*2;
		offset.y += Math.sin(floatTime)*room.scaleFactor/2;
	}
}