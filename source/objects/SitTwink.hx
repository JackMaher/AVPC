package objects;
import adventure.*;
import flixel.util.FlxColor;



class SitTwink extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Adam";
        loadGraphic("assets/images/sittwink.png", true,21,26);
        animation.add("move",[0,1,2,3,4,4,4,4,4],5,true);
        animation.play("move");
		layer=BACK;
		speechColor = 0xffEF626C;
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
        player.say("He has a smug vibe about him."); //CHANGE
    }

	override function use(){
		var player:Player = room.get(Player);
		var interact = [
			{time:0.0,run:function(){
				player.say("Hello.");
			}},
			{time:3.0,run:function(){
				say("Could you not?");
				player.canControl = true;
				Global.cutscene = false;
			}},
			];


		player.walkToObject(SitTwink, X, LEFT, function(){
			player.flipX = true;
			player.canControl = false;
			Global.cutscene = true;
			Event.run(interact, false);
		});

	}
}