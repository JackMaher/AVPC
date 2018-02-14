package objects;
import adventure.*;
import flixel.util.FlxColor;



class Poptwink extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Gayvin";
		speechColor = 0xffff8fa6;
		layer=BACK;
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

		player.say("His eyes seem glazed over.");
	}
	override function use(){
		var player:Player = room.get(Player);

		var talk = [
		{time:0.0,run:function(){
			player.say("Hello",null, 2);
		}},
		{time:2.0,run:function(){
			say("*SNIFF* Ride that wave man.",null, 2);
		}},
		{time:4.0,run:function(){
			player.say("I'd rather not.",null, 2);
		}},
		];
		Event.run(talk,false);
	}
}