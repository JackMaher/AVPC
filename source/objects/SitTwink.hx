package objects;
import adventure.*;
import flixel.util.FlxColor;



class SitTwink extends Object {
	var introDone = false;

	public function new(x,y){
		super (x,y);
		customName = "Adam";
        loadGraphic("assets/images/sittwink.png", true,21,26);
        animation.add("move",[0,1,2,3,4,4,4,4,4],5,true);
        animation.play("move");
		layer=BACK;
		speechColor = 0xffEF626C;
	}
	override function use(){
		var player:Player = room.get(Player);
			if(introDone == true){
				return;
			}
		var interact = [
			{time:0.0,run:function(){
				introDone = true;
				player.say("Hey!");
			}},
			{time:3.0,run:function(){
				say("Could you not?");
			}},
			{time:6.0,run:function(){
				player.say("Could I not do what?");
			}},
			{time:9.0,run:function(){
				say("Just not.");
				player.canControl = true;

			}},
			];


		player.walkToObject(SitTwink, X, LEFT, function(){
			player.flipX = true;
			player.canControl = false;
			Event.run(interact, false);
		});

	}
}