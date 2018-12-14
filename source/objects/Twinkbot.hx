package objects;
import adventure.*;
import flixel.util.FlxColor;



class Twinkbot extends Object {
	public static var CatCome:Bool = false;
	var SodSpoke:Bool = false;
	var CatQuest: Bool = false;

	public function new(x,y){
		super (x,y);
		customName = "Twink Bot";
		layer=BACK;
		        ticks = [
            {word:"LOOK", callback:function(){
                look(); 
            }},
            {word:"TALK", callback:function(){
                use(); 
            }}
        ];


	}

	override public function look(){
		var player:Player = room.get(Player);
		player.say("What is he doing?");

	}

	override public function use(){
		var player:Player = room.get(Player);
		player.say("What is he doing?");
	}

}