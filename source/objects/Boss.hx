package objects;
import adventure.*;
import flixel.util.FlxColor;



class Boss extends Object {
	var done:Bool = false;

	var floatTime:Float = 0;

	public function new(x,y){
		super (x,y);
		speechColor = FlxColor.GREEN;
		customName = "Luthberge";
        loadGraphic("assets/images/boss.png", true,43,25);
        //animation.add("hover",[0,1,2,3,5],6,true);
        //animation.play("hover");
                ticks = [
            {word:"LOOK", callback:function(){
                look(); 
            }},
            {word:"TALK", callback:function(){
                use(); 
            }},
        ];
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

	override public function update(d) {
		super.update(d);
		offset.y -= Math.sin(floatTime)*room.scaleFactor;
		floatTime += d;
		floatTime %= Math.PI*2;
		offset.y += Math.sin(floatTime)*room.scaleFactor;
	}

	override function look(){
		var player:Player = room.get(Player);

		player.say("Thats Leonard Luthberge, captin of this ship");

	}

	override function use(){
		var player:Player = room.get(Player);

		if(Player.maxxSex == true){
			var endingCut = [
			{time:0.0,run:function(){
				player.say("Mr Luthberge, I know of a lead to Lucas Lena.", null, 4);
			}},
			{time:4.0,run:function(){
				player.say("I'm going to need my ship to follow this lead.", null, 4);
			}},
			{time:8.0,run:function(){
				say("You think I'm gonna let you run away in your ship?", null, 4);
			}},
			{time:12.0,run:function(){
				say("No, you can take one of my discountiued crusing ships.", null, 4);
			}},
			{time:16.0,run:function(){
				say("I'll keep your ship for insurance.", null, 4);
			}},
			{time:20.0,run:function(){
				say("I hope you dont mind stains Packwood.", null, 4);
			}},
			{time:24.0,run:function(){
				player.say("What about Sodsbur... I mean my Drone?", null, 4);
			}},
			{time:28.0,run:function(){
				say("Its been humming the Death March for the past 30 minutes.", null, 4);
			}},
			{time:32.0,run:function(){
				say("You can take it.", null, 4);
			}},
			{time:36.0,run:function(){
				say("The teleporter is ready when you are.", null, 4);
			}},
			{time:40.0,run:function(){
				say("Don't dissapoint me Packwood.", null, 4);
				Player.complete = true;
			}},
			];
			Event.run(endingCut, false);
		}

		 if (Player.spoketoBoss){
            return;
        }


		var interact = [
			{time:0.0,run:function(){
				done = true;
				player.say("Mr Luthberge, I wasnt expecting to be docked by you today", null, 4);
			}},
			{time:3.0,run:function(){
				say("Let's dispense with the pleasantries shall we Rodger Packwood", FlxColor.GREEN,4);
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
				player.canControl = true;

			}},


		];
		Event.run(interact, false);
		player.canControl = false;

	}
}

