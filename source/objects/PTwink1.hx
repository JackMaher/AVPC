package objects;
import adventure.*;
import flixel.util.FlxColor;



class PTwink1 extends Object {
		var floatTime:Float = 0;
		var done = false;

	public function new(x,y){
		super (x,y);

		customName = "Lance";
		speechColor = FlxColor.CYAN;
		layer=FORE;
	}
	override function look(){
		var player:Player = room.get(Player);

		player.say("I wish I had his confindence, it's at least two inches longer than mine.");


	}
	override function use(){
		var player:Player = room.get(Player);
				if(done) return;
        		done = true;

		var interact = [
			{time:2.0,run:function(){

				say("Who are you staring at?", FlxColor.CYAN, 2);
			}},
			{time:4.0,run:function(){
				player.say("I... I just wanted to ask yo....", null,1.5);
			}},	
			{time:4.7,run:function(){
				say("Just leave me alone", FlxColor.CYAN,3);
			}},	
			{time:7.0,run:function(){
				player.say("(oh... ok)", null,3);
				done = false;
			}},	
		];


		player.walkToObject(PTwink1, X, RIGHT, function(){
			player.flipX = false;
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