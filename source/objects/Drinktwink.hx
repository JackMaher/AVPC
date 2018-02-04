package objects;
import adventure.*;
import flixel.util.FlxColor;



class Drinktwink extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Johnny";
        loadGraphic("assets/images/drinktwink.png", true,13,33);
        animation.add("move",[0,1,2,3,3,2,1,0,0,0,0,0,0,0,0,0,0,0,0],8,true);
        animation.play("move");
		layer=FORE;
	}

	override function use(){
		var player:Player = room.get(Player);


		var interact = [
			{time:0.0,run:function(){
				player.say("Umm...", FlxColor.ORANGE, 1);
			}},
			{time:1.0,run:function(){
				say("Hey! Youre Rodger Packwood right?", 0xffAD2DA5,4);
				say("I heard you teleport in.", 0xffAD2DA5,4);
			}},		
			{time:5.0,run:function(){
				player.say("Yeah, I'm Rodger, but people just call me Packwood.", FlxColor.ORANGE, 3);
			}},
			{time:8.0,run:function(){
				say("Well its nice to meet you Packwood, I'm Johnny.", 0xffAD2DA5,4);
			}},	
			{time:12.0,run:function(){
				say("I hope Adam and Steve didnt cause any troubles when you came in", 0xffAD2DA5,4);
			}},	

			{time:16,run:function(){
				player.option("Whats their deal?", FlxColor.BLUE,function(){
					player.say("fuck those guys");

			)}};
			
		];
		
			Event.run(interact);
			

		};
}