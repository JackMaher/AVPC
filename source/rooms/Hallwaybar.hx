package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.util.FlxColor;



class Hallwaybar extends Room {
	var done = false;
    override public function create() {
        //scaleFactor = 8;
        objects = [
					new RoomTrigger(6,Loohall,90,10),
					new Block(109),
					new Nathan(107,11),
					new Hallwaybardoor(45,8),
					new Doorman(71,13),
        			new Player(10,10)];
    }

    override public function update(d){


		   if(Player.std == true){

		   	if(done) return;
		   	done = true;

		   var player:Player = get(Player);	
		   var nathan:Nathan = get(Nathan);	

		    var stdDeath = [
				{time:0.0,run:function(){
					player.say("Ow, something itches.", null, 2);
					player.canControl = false;
					Global.canInteract = false;
					trace(Player.std);
				}},

				{time:2.0,run:function(){
					player.walkToObject(Nathan, X, LEFT, function(){
						player.flipX = true;
						player.say("This really, really hurts.");
					});
				}},
				{time:6.0,run:function(){
					player.walkTo(player.x - 500, player.y, function(){
						player.say("Ow.");
					});
				}},

				{time:10.0,run:function(){
					if (Player.clothed == false){
						player.say("This itches bad.", null, 2);
					}
					else{
						player.say("I'm feeling really warm");
						player.customAnimation = "undress";
						player.afterAnimation (function(){
							player.customAnimation = null;
							Player.clothed = false;
						});
					}
					
				}},
				{time:13.0,run:function(){
						player.say("Oh god, why is that swollen");
				}},
				{time:16.0,run:function(){
						nathan.say("Mmmpph... Mppph!");
				}},
				{time:19.0,run:function(){
						player.say("What do you mean Space Clap?");
				}},
				{time:23.0,run:function(){
						player.customAnimation = "std";
							player.afterAnimation (function(){
							player.customAnimation = "stdIdle";
							player.say("Momma?",FlxColor.LIME, null);
						});
				}},
    		];

    		Event.run(stdDeath,false);
    }
super.update(d);
}}