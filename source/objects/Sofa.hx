package objects;
import adventure.*;
import flixel.util.FlxColor;



class Sofa extends Object {

	var floatTime:Float = 0;

	public function new(x,y){
		super (x,y);
		customName = "Sofa";
        loadGraphic("assets/images/sofa.png", true,38,19);
        //animation.add("flash",[0,1,2,3],4,true);
        //animation.play("flash");
		layer=BACK;
	}
	override function look(){
		var player:Player = room.get(Player);
				player.say("This has some questionable stains.");
	}


	override public function update(d) {
		super.update(d);
		offset.y -= Math.sin(floatTime)*room.scaleFactor;
		floatTime += d;
		floatTime %= Math.PI*2;
		offset.y += Math.sin(floatTime)*room.scaleFactor;
	}

}