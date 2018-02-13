package objects;

import adventure.*;
import rooms.*;

import flixel.util.FlxColor;
import flixel.FlxG;



class LiftAI extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Lift";
		speechColor = FlxColor.GREEN;
		loadGraphic("assets/images/liftai.png", true,6,8);
		animation.add("Talk",[0,1,2,3,4], 4, true);
		ticks = [
	            {word:"TALK", callback:function(){
	                use(); 
	            }},
            ];
	}

	override function use(){

		var player:Player = room.get(Player);

		player.canControl = false;


		var changeFloor = function(Floor,PlayerX,PlayerY) {
			var door = room.get(LiftDoor);
			door.newRoom = Floor;
			door.newPlayerX = PlayerX;
			door.newPlayerY = PlayerY;

			FlxG.camera.shake(0.01,1);
			var done = [
			{time:1.0, run:function(){
				player.canControl = true;
			}}
			];

			Event.run(done,false);
		}

		var speakToBoss = [
			{time:0.0,run:function(){
				say("Hello", FlxColor.GREEN, 2);
				animation.play("Talk");
			}},
			{time:2.0,run:function(){
				player.say("Umm Hello?", null, 2);
			}},			
			{time:4.0,run:function(){
				say("Mr Luthberge asked me to send you straight to him.", FlxColor.GREEN, 2);
				changeFloor(PenthouseHallway, 43, 10);
			}},
		];




		var interact = [

			{time:0.0,run:function(){
				say("Hello", FlxColor.GREEN, 2);
				animation.play("Talk");
			}},
			{time:2.0,run:function(){

				player.say("Hello Lift", FlxColor.WHITE, 2);
			}},
			{time:4.0,run:function(){
				say("I wish more people rode me like you do.", FlxColor.GREEN, 2);
				animation.play("Talk");
			}},
			{time:6.0,run:function(){

				player.say("Excuse me?", FlxColor.WHITE, 2);
			}},
			{time:7.0,run:function(){
				say("What Floor?", FlxColor.GREEN, 1);
				animation.play("Talk");
			}},



			{time:9.0,run:function(){

				player.option("Floor 1", FlxColor.BLUE,function(){ 
					changeFloor(Hallway1, 39, 10);
					say("Maintenance Floor! (please dont leave me)",FlxColor.GREEN);
				});
				player.option("Bar Floor", FlxColor.BLUE,function(){ 
					changeFloor(Bar, 140, 21);
					say("Bar Floor! (I cant remember the last time I had a drink)",FlxColor.GREEN);
				});
				player.option("Penthouse Floor", FlxColor.BLUE,function(){ 
					changeFloor(PenthouseHallway, 43, 10);
					say("Penhouse Floor! (Tell Luthberge I miss him)",FlxColor.GREEN);
				});
				player.endOptions();

			}},		
		];

		if (Player.spoketoBoss == true){
				Event.run(interact, false);
			}
		else{
				Event.run(speakToBoss, false);
			}


		//Event.run(speakToBoss, false);

	}
}