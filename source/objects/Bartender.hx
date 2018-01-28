package objects;
import adventure.*;
import flixel.util.FlxColor;



class Bartender extends Object {

	public function new(x,y){
		super (x,y);
        loadGraphic("assets/images/bartender.png", true,17,13);
        animation.add("hover",[0,1,2,3],6,true);
        animation.play("hover");
        customName="Bar-Bot 2300";


	}
	override function look(){
		var player:Player = room.get(Player);

		player.say("Smells like a well used barbot");


	}
	override function use(){
		var player:Player = room.get(Player);

		var interact = [
			{time:0.0,run:function(){
				say("Greetings Madam... Sir... ", FlxColor.PINK, 4);
			}},
			{time:2.0,run:function(){
				player.say("...its Sir...", null, 3);
			}},
			{time:5.0,run:function(){
				say("Whatever you say luv, need a drink?", FlxColor.PINK, 4);
			}},
			{time:8.0,run:function(){
				player.say("No thanks");
			}}
			];
			Event.run(interact);
	}
}