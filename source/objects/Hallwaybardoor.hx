package objects;
import adventure.*;
import rooms.*;
import flixel.util.FlxColor;


class Hallwaybardoor extends Door {
var doorActive:Bool = false;
	public function new(x,y){
		super(x,y);
		customName = "Maxx Cream's Room";
	}

	override function use(){
		var player:Player = room.get(Player);
		var doorman:Doorman = room.get(Doorman);


		var interact = [
			{time:0.0,run:function(){
				doorman.animation.play("open");
			}},
			{time:2.0,run:function(){
				doorman.say("Password?", FlxColor.GREEN, 4);
			}},
			{time:4.0,run:function(){
				player.say("Umm?", null,4);

			}},			
			{time:5.0,run:function(){
				doorman.animation.play("closed");
			}}
		];


		var test = [
			{time:0.0,run:function(){
				doorman.animation.play("open");
			}},
			{time:2.0,run:function(){
				doorman.say("Password?", FlxColor.GREEN, 4);
			}},
			{time:4.0,run:function(){
				player.say("Umm 'Technically Legal'?", null ,4);

			}},			
			{time:6.0,run:function(){
				doorman.animation.play("closed");
			}},
			{time:8.0,run:function(){
				say("*CLICK*");
				doorActive = true;

			}},	
		
	
		];

			if (Player.passwordHeard == false){
				Event.run(interact, false);
			}
			else{
				Event.run(test, false);
			}
			
			if (Player.passwordHeard == true&&doorActive == true){
				newRoom=MaxxCreamRoom;
				newPlayerX = 20;
				newPlayerY =10;

				go();

			}

		}
	}
