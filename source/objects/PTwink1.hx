package objects;
import adventure.*;
import flixel.util.FlxColor;



class PTwink1 extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Lance";
		layer=FORE;
	}
	override function look(){

		say("PTwink1");


	}
	override function use(){
		var player:Player = room.get(Player);


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
			}},	
		];


		player.walkToObject(PTwink1, X, RIGHT, function(){
			player.flipX = false;
			Event.run(interact, false);
		});
	}
}