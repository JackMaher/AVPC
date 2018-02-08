package objects;
import adventure.*;
import flixel.util.FlxColor;



class OccupiedToilet extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Stall";
		speechColor = FlxColor.LIME;
	}
	override function look(){

		var interact = [
			{time:0.0,run:function(){
				say("Mate it's occupied", FlxColor.GREEN, 2);
			}},
			{time:2.0,run:function(){
				say("Yeah bugger off", FlxColor.WHITE,2);
			}}
		];

		Event.run(interact, false);
	}
}