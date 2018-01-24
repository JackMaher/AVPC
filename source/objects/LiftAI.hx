package objects;

import adventure.*;
import rooms.*;

import flixel.util.FlxColor;
import flixel.FlxG;



class LiftAI extends Object {

	public function new(x,y){
		super (x,y);
		customName = " ";
		loadGraphic("assets/images/liftai.png", true,6,8);
		animation.add("Talk",[0,1,2,3,4], 4, true);
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

		var interact = [

			{time:0.0,run:function(){
				say("Hello", FlxColor.GREEN, 2);
				animation.play("Talk");
			}},
			{time:2.0,run:function(){

				player.say("Hello Lift", FlxColor.WHITE, 2);
			}},
			{time:4.0,run:function(){
				say("*I like it when you come inside me*", FlxColor.GREEN, 2);
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

				player.option("Maintenance", FlxColor.BLUE,function(){ 
					changeFloor(Hallway1, 39, 10);
					say("Maintenance Floor! (please dont leave me)",FlxColor.GREEN);
				});
				player.option("Bar", FlxColor.BLUE,function(){ 
					changeFloor(Bar, 140, 21);
					say("I've been taking heavy loads all day",FlxColor.GREEN);
				});
				player.option("Penthouse", FlxColor.BLUE,function(){ 
					changeFloor(PenthouseHallway, 39, 10);
					say("I've been taking heavy loads all day",FlxColor.GREEN);
				});
				player.endOptions();

			}},		
		];

		Event.run(interact, false);

	}
}