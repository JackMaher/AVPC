package objects;
import adventure.*;
import flixel.util.FlxColor;



class SitTwink2 extends Object {

		var introDone = false;	

	public function new(x,y){
		super (x,y);
		customName = "Steve";
        loadGraphic("assets/images/sittwink2.png", true,21,26);
        animation.add("move",[0,1,2,3,4,4,4,4,4,4,4,4,4,4],8,true);
        animation.play("move");
		layer=BACK;
		speechColor = 0xff84DCCF;
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
        player.say("Seems quite.");
    }
	override function use(){

		var player:Player = room.get(Player);
		var twink2:SitTwink = room.get(SitTwink);

			if(introDone == true){
				return;
			}
		var interact = [
			{time:0.0,run:function(){
				introDone = true;
				player.say("Hello");
			}},
			{time:3.0,run:function(){
				say("Ummm He...");
			}},
			{time:6.0,run:function(){
				twink2.say("Dont talk to him Steve.");
			}},
			{time:9.0,run:function(){
				twink2.say("You dont know where hes been.");
				player.canControl = true;
				Global.canInteract = true;
			}},
			];
		player.walkToObject(SitTwink2, X, RIGHT, function(){
			player.flipX = false;
			player.canControl = false;
			Global.canInteract = false;
			Event.run(interact, false);
		});


	}
}