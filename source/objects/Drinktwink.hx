package objects;
import adventure.*;
import flixel.util.FlxColor;



class Drinktwink extends Object {
	var introDone = false;

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

		if(introDone) { return; }

									//Intro Dialog
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

					//Intro Dialog Tree
			{time:16,run:function(){
				player.option("Nothing I coudnt handle.", FlxColor.BLUE,function(){ 
			        var opt1 = [
			            {time:3.0,run:function(){
			                say("Glad to hear, they've had a stick up their arse since Pride.", 0xffAD2DA5, 3);
			            }},
			            {time:6.0,run:function(){
			                say("Apperently Brit-Tron invited them backstage", 0xffAD2DA5, 3);
			              	say("They've been insufferable since.", 0xffAD2DA5, 3);
			            }},
		            ];
					Event.run(opt1);

				});
				player.option("[[A reasonable and leveled headed telling of what happen]]", FlxColor.BLUE,function(){ 
					
					player.say("Fuck those guys.",FlxColor.ORANGE);

			        var opt2 = [
			            {time:3.0,run:function(){
			                say("Yep sounds like Adam and Steve.", 0xffAD2DA5, 3);
			            }},
			            {time:6.0,run:function(){
			                say("Just ignore them, they're just a couple of H.F.Q.", 0xffAD2DA5, 3);
			            }},
			         	{time:9.0,run:function(){
			                player.say("H.F.Q.?", FlxColor.ORANGE, 3);
			            }},
			  			 {time:12.0,run:function(){
			                say("High Functioning Queers.", 0xffAD2DA5, 3);
			            }},
			        	{time:15.0,run:function(){
			                say("If you need anything just come asking.", 0xffAD2DA5, 3);
			            }},

		            ];
					Event.run(opt2);
				});
				player.endOptions();
				introDone = true;
			}},	
				
		];
		
			Event.run(interact);
			

		};
}