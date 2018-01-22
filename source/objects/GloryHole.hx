package objects;
import adventure.*;
import flixel.util.FlxColor;



class GloryHole extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Small hole";
	}

	override function look(){
		say("A small hole has seem to be drilled between the stalls");
	}

	override function use(){

		var player:Player = room.get(Player);

		var interact = [
			{time:0.0,run:function(){
				say("Mate it's occupied", FlxColor.GREEN, 4);
			}},
			{time:2.0,run:function(){
				say("Yeah bugger off", FlxColor.WHITE,4);
			}},
			{time:4.0,run:function(){
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
				Event.run(interact, false);
			});

		});

	}

}