package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.FlxG;



class Albert extends Object {
    public var festive: Bool = false;
	public function new(x,y){
		super (x,y);
		customName = "Unfestive Albert";
        loadGraphic("assets/images/albert.png", true,12,43);

        animation.add("flash",[1],1,true);
        //animation.play("flash");
		layer=BACK;
                ticks = [
            {word:"LOOK", callback:function(){
                look(); 
            }},
        ];
	}
    override function look(){
        var player:Player = room.get(Player);
        if(festive == false){
        player.say("A rather unfestive looking Albert.");
        }
        else {
            player.say("Looking very merry ALbert.");
        }
    }
}