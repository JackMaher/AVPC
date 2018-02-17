package objects;
import adventure.*;
import flixel.util.FlxColor;



class GloryHole extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Small hole";
		ticks = [
	            {word:"LOOK", callback:function(){
	                look(); 
	            }},
	            {word:"LISTEN", callback:function(){
	                use(); 
	            }},
            ];
	}

	override function look(){
		var player:Player = room.get(Player);
		player.say("A small hole has seem to be drilled between the stalls");
	}

	override function use(){

		var player:Player = room.get(Player);

		var interact = [
			{time:0.0,run:function(){
				say("Oh... Yeah...", FlxColor.LIME, 4);
			}},
			{time:2.0,run:function(){
				say("Mmmph...", FlxColor.CYAN,3);
			}},
			{time:4.0,run:function(){
				say("You're gonna have to roll a nat20 to get past the guard", FlxColor.LIME,3);
			}},	
			{time:7.0,run:function(){
				say("Mmmph... Mmmmph", FlxColor.CYAN,3);
			}},		
			{time:10.0,run:function(){
				say("Well done, you sneak past the guard", FlxColor.LIME,3);
			}},				
			{time:13.0,run:function(){
				say("You face a door who ask you for the password, do you know the password?", FlxColor.LIME,3);
			}},	
			{time:16.0,run:function(){
				say("Mmmph... Mmmmph...", FlxColor.CYAN,3);
			}},	
			{time:19.0,run:function(){
				say("Welldone you say the words 'Technically Legal' and the door opens.", FlxColor.LIME,3);
			}},	
			{time:22.0,run:function(){
				player.customAnimation="standup";

				player.afterAnimation( function(){
					player.customAnimation=null;
					player.canControl = true;
				});

			}},			
		];

		player.canControl = false;
		
		player.walkToObject(GloryHole, X, LEFT, function(){
			player.flipX = true;
			player.customAnimation="kneel";

			player.afterAnimation( function(){
				player.customAnimation="kneeled";
				Player.passwordHeard = true;
				Event.run(interact, false);
			});

		});

	}

}