package objects;
import adventure.*;
import flixel.util.FlxColor;



class PTwink2 extends Object {
			var floatTime:Float = 1000;

	public function new(x,y){
		super (x,y);
		customName = "Bruce";
		layer=FORE;
	}
	override function look(){

		say("PTwink2");


	}
	override public function update(d) {
		super.update(d);
		offset.y -= Math.sin(floatTime)*room.scaleFactor/2;
		floatTime += d*1.2;
		floatTime %= Math.PI*2;
		offset.y += Math.sin(floatTime)*room.scaleFactor/2;
	}
}