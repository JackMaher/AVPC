package objects;
import adventure.*;
import flixel.util.FlxColor;



class Bartender extends Object {

	public function new(x,y){
		super (x,y);
        loadGraphic("assets/images/bartender.png", true,17,13);
        animation.add("hover",[0,1,2,3],6,true);
        animation.play("hover");
        speechColor = FlxColor.PINK;
        customName="Bar-Bot 2300";
       			ticks = [
				{word:"LOOK", callback:function(){
	                look(); 
	            }},
	            {word:"TALK", callback:function(){
	                use(); 
	            }},
            ];


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
				say("We are well stock in liqoure, poppers, uppers, downers...",FlxColor.PINK);
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
						player.canControl = true;
					}},	

					];
					Event.run(PopperCon);
			
				});
				player.option("Liquore?", function(){
					var DrinkCon = [
					{time:4.0,run:function(){
						say("How old are you?");
					}},
					{time:7.0,run:function(){

						var drink21 = [
							{time:4.0,run:function(){
								say("Sorry luv, you gotta be twenty one to order a pint.");
							}},
							{time:8.0,run:function(){
								player.say("But I can get poppers?");
							}},
							{time:12.0,run:function(){
								say("We are anti undersage drinking, not anti fun.");
								player.canControl = true;
							}},

						];
						player.option("Ummm Twenty?", function(){

							Event.run(drink21);


						});
						player.option("Ahhh Twenty?", function(){
							Event.run(drink21);
						});
						player.option("Ninete... I mean Twenty", function(){
							Event.run(drink21);
							
						});
					}}
					];
					Event.run(DrinkCon);

				});

			}},



			];
			Event.run(interact);
			player.walkToObject(Bartender, X, RIGHT, function(){
				player.flipX = false;
				player.canControl = false;
			});
	}
}