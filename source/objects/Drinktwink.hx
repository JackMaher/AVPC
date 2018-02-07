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
		speechColor = 0xffAD2DA5;
	}

	override function use(){
		var player:Player = room.get(Player);


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
			            {time:9.0,run:function(){
			                say("If you need anything just come asking.", 0xffAD2DA5, 3);
			                player.canControl = true;
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
			                player.canControl = true;
			            }},

		            ];
					Event.run(opt2);
				});
				player.endOptions();
				introDone = true;
			}},	
				
		];
		
		

		if(introDone == true){
		var information = [
			{time:0.0,run:function(){
				player.say("Hey Johnny", FlxColor.ORANGE, 3);
			}},
			{time:3.0,run:function(){
				say("Hey, whats up?", 0xffAD2DA5, 4);
			}},
			{time:7.0,run:function(){
				if (Player.poppersComplete == true) {

					player.option("Maxx Cream?",function(){

						var info1List = [
							{time:0.0,run:function(){
								player.say("I'm looking for Maxx Cream", FlxColor.ORANGE, 3);
							}},			
							{time:3.0,run:function(){
								say("Everyone wants to see Maxx trust me", 0xffAD2DA5, 3);
							}},	
							{time:6.0,run:function(){
								player.say("So do you know where he is?", FlxColor.ORANGE, 3);
							}},	
							{time:9.0,run:function(){
								say("His private room is on the Bar level", 0xffAD2DA5, 3);
							}},	
							{time:12.0,run:function(){
								say("But they dont let any old riff raff in there", 0xffAD2DA5, 3);
							}},	
							{time:15.0,run:function(){
								say("No offence", 0xffAD2DA5, 2);
								player.canControl = true;
							}},	
						];
						Event.run(info1List);

					});

				}

				player.option("Luthberge?", function(){

						var info2List = [
							{time:0.0,run:function(){
								player.say("What do you know about Luthberge", FlxColor.ORANGE, 4);
							}},		
							{time:4.0,run:function(){
								say("Only meet him once, he rarely leaves his Penthouse Suite", 0xffAD2DA5, 4);
							}},	
							{time:8.0,run:function(){
								say("He's a part-time loan shark, part-time pawn brokers, part-time traffic warden", 0xffAD2DA5, 5);
							}},		
							{time:13.0,run:function(){
								say("He's the worse of the worse", 0xffAD2DA5, 4);
								player.canControl = true;
							}},			
						];
						Event.run(info2List);

					});

				player.option("Yourself?",function(){

						var info3List = [
							{time:0.0,run:function(){
								player.say("What are you doing on this ship?", FlxColor.ORANGE, 4);
							}},		
							{time:4.0,run:function(){
								say("My parents was deeply debt to Luthberge", 0xffAD2DA5, 4);
							}},	
							{time:8.0,run:function(){
								say("When it came time to pay him back, they didnt have the funds", 0xffAD2DA5, 5);
							}},		
							{time:13.0,run:function(){
								say("So they offered me instead, a fair trade by today standards I guess", 0xffAD2DA5, 4);
							}},		
							{time:17.0,run:function(){
								player.say("Thats awful", null, 4);
							}},	
							{time:17.0,run:function(){
								say("Its not so bad, you learn to deal with it", 0xffAD2DA5, 4);
								player.canControl = true;
							}},	
						];
						Event.run(info3List);

					});


			}}
			];

		Event.run(information);
	}

	else{
		Event.run(interact);
	}
	player.canControl = false;

			
			
			

		};
}