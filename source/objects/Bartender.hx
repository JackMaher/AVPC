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
		var twink2:PTwink2 = room.get(PTwink2);
		var twink3:PTwink3 = room.get(PTwink3);

		var interact = [
			{time:0.0,run:function(){
				say("Greetings Madam... Sir... ", FlxColor.PINK, 4);
			}},
			{time:2.0,run:function(){
				player.say("...its Sir...", FlxColor.ORANGE, 3);
			}},
			{time:5.0,run:function(){
				say("Whatever you say luv, whatcha fancy?", FlxColor.PINK, 4);
			}},
			{time:8.0,run:function(){
				say("We are well stock in liqoure, poppers, uppers, downers...",FlxColor.ORANGE);
			}},

			{time:12,run:function(){
				player.option("Poppers?", function(){
					var PopperCon = [
					{time:4.0,run:function(){
						say("We have the latest line in Poppers aviable on the first floor.");
					}},
					{time:8.0,run:function(){
						twink2.say("Man I miss my poppers");
					}},		
					{time:12.0,run:function(){
						twink3.say("What happen?");
					}},				
					{time:16.0,run:function(){
						twink2.say("Spilt them on the floor in the bathroom.");
					}},	
					{time:20.0,run:function(){
						twink3.say("OH so thats why you have the faint smell of a norwegian lumberjack.");
					}},	

					];
					Event.run(PopperCon);
					
			
				});
			}}



			];
			Event.run(interact);
	}
}