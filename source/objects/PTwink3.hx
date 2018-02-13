package objects;
import adventure.*;
import flixel.util.FlxColor;



class PTwink3 extends Object {
	var floatTime:Float = 500;
	var done = false;

	public function new(x,y){
		super (x,y);
		customName = "Kurt";
		pixelPerfectRender = false;
		layer=FORE;
		speechColor = FlxColor.YELLOW;
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
				player.say("Generic Looking Twink #143");
			}},
			{time:3.0,run:function(){
				say("I can hear you, dickward, you're not so dymanic yourself");
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
				player.say("I'm looking for Lena, do you know anything about him");
			}},
			{time:3.0,run:function(){
				say("Go suck an egg.");
			}},
			{time:6.0,run:function(){
				player.say("I really need...");
			}},
			{time:9.0,run:function(){
				say("Go. Suck. An. Egg.");
				done = false;
				player.canControl = true;
			}},
			];
		player.walkToObject(PTwink3, X, LEFT, function(){
			player.canControl = false;
			player.flipX = true;
			Event.run(interact, false);
		});

	}


	override public function update(d) {
		super.update(d);
		offset.y -= Math.sin(floatTime)*room.scaleFactor/2;
		floatTime += d;
		floatTime %= Math.PI*2;
		offset.y += Math.sin(floatTime)*room.scaleFactor/2;
	}
}