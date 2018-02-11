package objects;
import adventure.*;
import flixel.util.FlxColor;



class Dispendershead extends Object {
	var floatTime:Float = 0;

	public function new(x,y){
		super (x,y);
		hidden = true;
		layer=FORE;
	}
		override public function update(d) {
		super.update(d);
		offset.y -= Math.sin(floatTime)*room.scaleFactor*0.75;
		floatTime += d*2;
		floatTime %= Math.PI*2;
		offset.y += Math.sin(floatTime)*room.scaleFactor*0.75;
	}
}