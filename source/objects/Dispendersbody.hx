package objects;
import adventure.*;
import flixel.util.FlxColor;



class Dispendersbody extends Object {
	var floatTime:Float = 0.5;

	public function new(x,y){
		super (x,y);
		customName = " ";
		layer=FORE;
	}
	override public function update(d) {
		super.update(d);
		offset.y -= Math.sin(floatTime)*room.scaleFactor;
		floatTime += d*2;
		floatTime %= Math.PI*2;
		offset.y += Math.sin(floatTime)*room.scaleFactor;
	}
}