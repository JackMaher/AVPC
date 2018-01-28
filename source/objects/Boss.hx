package objects;
import adventure.*;
import flixel.util.FlxColor;



class Boss extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Luthberge";
        loadGraphic("assets/images/boss.png", true,43,25);
        animation.add("hover",[0,1,2,3,5],6,true);
        animation.play("hover");
		layer=FORE;
	}
	override function look(){
		var player:Player = room.get(Player);

		player.say("Thats Leonard Luthberge, captin of this ship");

	}

	override function use(){
		var player:Player = room.get(Player);


		var interact = [
			{time:0.0,run:function(){
				player.say("Mr Luthberge, I wasnt expecting to be docked by you today", FlxColor.WHITE, 4);
			}},
			{time:3.0,run:function(){
				say("Let's dispense with the pleasantries shall we Dick Sparrow", FlxColor.GREEN,4);
			}},
			{time:7.0,run:function(){
				say("Where is my money, its time to pay your debts.",FlxColor.GREEN, 3);

			}},			
			{time:10.0,run:function(){
				player.say("Ahh.. yes...",null,2);
			}},
			{time:11.0,run:function(){
				player.say("My debt...",null,2);
			}},
			{time:12.0,run:function(){
				player.say("The funny thing about my debt is...",null,2);
			}},
			{time:13.0,run:function(){
				say("Enough! I'm sick of having to deal with you",FlxColor.GREEN,4);
			}},
			{time:17.0,run:function(){
				say("You know how this is gonna end, I will liquidate your ship",FlxColor.GREEN,4);
			}},
			{time:21.0,run:function(){
				say("and I'll throw you to The Bear",FlxColor.GREEN,2);
			}},
			{time:24.0,run:function(){
				player.say("Please anything but The Bear",null,3);
			}},
			{time:25.0,run:function(){
				player.say("(he never washes)",null,2);
			}},
			{time:27.0,run:function(){
				player.say("I'll get you your money, I just need more time",null,3);
			}},
			{time:29.0,run:function(){
				say("Enough enough, quite your whinning, howabout I cut you a deal",FlxColor.GREEN,4);
			}},
			{time:33.0,run:function(){
				player.say("Anything Mr Luthberge! Anything",null,3);
			}},
			{time:35.0,run:function(){
				say("Let me finish! I need someone to return some stolen property",FlxColor.GREEN,4);
			}},

			{time:39.0,run:function(){
				say("Go down to the bar, and ask my boys about Lena",FlxColor.GREEN,3);
			}},
			{time:42.0,run:function(){
				say("You have 3 days Dick, dont dissapoint me",FlxColor.GREEN,3);
			}},
			{time:45.0,run:function(){
				player.say("Yes Sir! I'll bring you Lena",null,3);
				Player.spoketoBoss = true;
			}},


		];
		Event.run(interact, false);

	}
}

