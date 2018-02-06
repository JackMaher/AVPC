package objects;
import adventure.*;
import flixel.util.FlxColor;



class Bog extends Object {

	var conDone:Bool = false;

	public function new(x,y){
		super (x,y);
		customName = "Bog";
		layer=BACK;
	}
	
	override function use(){
		if (conDone == true){
			return;
		}
		var player:Player = room.get(Player);
		conDone = true;
		//player.say("sure why not");

		var interact = [
		{time:0.0,run:function(){
			player.say("gross");
			player.customAnimation="standup";
			player.afterAnimation(function(){
				player.customAnimation = null;
				Global.inventory.add(new ReusableProphylactic(-1000,20) );
			});
		}}

		];






		player.walkTo(x - 50,player.y,function(){
			player.flipX = true;
			player.customAnimation="kneel";

			player.afterAnimation( function(){
				player.customAnimation="kneeled";
				Event.run(interact, false);
			});

		});

	}


}