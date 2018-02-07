package objects;
import adventure.*;
import flixel.util.FlxColor;



class PTwink3 extends Object {
	var floatTime:Float = 500;

	public function new(x,y){
		super (x,y);
		customName = "Kurt";
		pixelPerfectRender = false;
		layer=FORE;
	}
	override function look(){

		say("PTwink3");


	}

	override public function update(d) {
		super.update(d);
		offset.y -= Math.sin(floatTime)*room.scaleFactor/2;
		floatTime += d;
		floatTime %= Math.PI*2;
		offset.y += Math.sin(floatTime)*room.scaleFactor/2;
	}
}