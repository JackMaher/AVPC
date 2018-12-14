package objects;
import adventure.*;
import flixel.util.FlxColor;



class Spacestation extends Object {

	public function new(x,y){
		super (x,y);
        loadGraphic("assets/images/spacestation.png", true,24,24);
        animation.add("spin",[0,1,2,3,6,5],3,true);
        animation.play("spin");
		customName = "Space Station";
		layer=BACK;
		        ticks = [
            {word:"LOOK", callback:function(){
                look(); 
            }},
        ];
	}

	override public function look(){
		var player:Player = room.get(Player);
		player.say("That's where Johnnys gone to get supplies.");

	}
}