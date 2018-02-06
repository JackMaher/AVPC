package objects;
import adventure.*;
import flixel.util.FlxColor;



class MaxxCream extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Maxx Cream";
		speechColor = 0xffcccccc;
		layer=BACK;
	}
		override function look(){
			var player:Player = room.get(Player);

		player.say("Could you please put some clothes on?", FlxColor.ORANGE);


	}

		override function use(){
			var player:Player = room.get(Player);
			var camera:Camera = room.get(Camera);
			var interact = [
			{time:0.0,run:function(){
				say("You must be my 4 o'clock", null , 3);
			}},
			{time:3.0,run:function(){
				player.say("Umm...", null, 2);
			}},
			{time:4.0,run:function(){
				say("You requested a Sloppy Joe, Coventry Clanger...", null, 3);
			}},
			{time:6.0,run:function(){
				player.say("Actually...", null, 2);
			}},
			{time:7.0,run:function(){
				say("I also have the items you asked for:", null, 2);
			}},
			{time:9,run:function(){
				say("Egg Whisk", null, 4);
				say("4 and a half apples", null, 4);
				say("Didgeridoo", null, 4);
			}},
			{time:12.0,run:function(){
				player.say("You must have me mistaken fo...", null, 2);
			}},
			{time:13.0,run:function(){
				say("Rope", null, 4);
				say("Some double gloucester", null, 4);
				say("Another slighty larger Didgeridoo", null, 4);
			}},
			{time:15.0,run:function(){
				player.say("WILL YOU LISTEN TO ME!", null, 3);
			}},
			{time:18.0,run:function(){
				say("Keep your voice down, what the hell is your problem", null, 3);
			}},
			{time:21.0,run:function(){
				camera.say("Do we have a problem Mr Cream?", null, 3);
			}},
			{time:24.0,run:function(){
				say("Max shakes his head looking at the camera.", FlxColor.WHITE, 3);
			}},
			{time:26.0,run:function(){
				camera.say("Good.", null, 3);
			}},
			{time:27.0,run:function(){
				say("Look, my Boss is watching, what do you want?", null, 3);
			}},
			{time:30.0,run:function(){
				player.say("Information, the boys at the Bar said you have information on Lena", null, 3);
			}},
			{time:33.0,run:function(){
				say("Jesus Christ Ok, but we have todo this my way.", null, 3);
			}},
			{time:36.0,run:function(){
				camera.say("Time is Money Maxx.", null, 3);
			}},
			{time:39.0,run:function(){
				say("The only way we can talk privately is if you get into bed with me.", null, 3);
			}},
			{time:42.0,run:function(){
				player.say("Get into bed with you?", null, 3);
			}},
			{time:45.0,run:function(){
				say("The boss is gonna get supisous if we just sit around talking.", null, 3);
			}},
			{time:47.0,run:function(){
				player.say("Fine. Fine.", null, 3);
			}},
			];
			Event.run(interact, false);
		}
	
}