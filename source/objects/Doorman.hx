package objects;
import adventure.*;
import flixel.util.FlxColor;



class Doorman extends Object {

	public function new(x,y){
		super (x,y);
		hidden = true;
        loadGraphic("assets/images/doorman.png", true,11,6);
        animation.add("open",[0,1,2,3,4],5,false);
        animation.add("closed",[4,3,2,1,0],5,false);
		layer=BACK;
	}

	override function use(){

		var player:Player = room.get(Player);

		var interact = [
			{time:0.0,run:function(){
				animation.play("open");
			}},
			{time:2.0,run:function(){
				say("Password?", FlxColor.GREEN, 4);
			}},
			{time:4.0,run:function(){
				player.say("Umm?", FlxColor.WHITE,4);

			}},			
			{time:5.0,run:function(){
				animation.play("closed");
			}}
		];
			Event.run(interact, false);

		}

	}
