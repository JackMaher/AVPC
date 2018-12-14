package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.util.FlxColor;



class Wine extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Wine";
		changeScale(4);
		layer=FORE;

	}
	override function useOn ( other:Object ) {
	var player:Player = room.get(Player);
	var twink:Twinkbot = room.get(Twinkbot);

		if(other.name == "Twink Bot"){

		var interact = [
			{time:0.0,run:function(){
				player.say("Here you go Adam, Merry Christmas.");
			}},
			{time:3.0,run:function(){
				twink.say ("Oh my god, are you going to pour that Wine in my tank?");
			}},
			{time:6.0,run:function(){
				player.say ("Yep, I know that before you... beheading you loved a drink!");
			}},
			{time:9.0,run:function(){
				twink.say ("Thats actually really thoughtful, thank you Packwood. Merry Christmas");
				Global.inventory.remove(this);
				twink.TwinkQuest = true;
				player.TwinkBotQuest = true;
			}},
			];
			Event.run(interact);
			
		}
	}

	override function look(){
		say("Worth the wait.");
	}
}
