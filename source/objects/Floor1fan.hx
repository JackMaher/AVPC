package objects;
import adventure.*;
import flixel.util.FlxColor;



class Floor1fan extends Object {

	public function new(x,y){
		super (x,y);
        loadGraphic("assets/images/floor1fan.png", true,12,12);
        animation.add("spin",[0,1,2,3],16,true);
        animation.play("spin");
		customName = "Fan";
		layer=BACK;
		        ticks = [
            {word:"LOOK", callback:function(){
                look(); 
            }},
        ];
	}

	override public function look(){
		var player:Player = room.get(Player);
		player.say("You spin me right round, baby right round.");

	}
}