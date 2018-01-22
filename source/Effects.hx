package;

import flixel.*;
import flash.filters.*;
import flixel.graphics.frames.FlxFilterFrames;

class Effects {
	
	static public function makeGlow(sprite:FlxSprite,color:Int) {
		var glowFilter = new GlowFilter(color, 1, 5, 5, 2, 1);

		var frame = FlxFilterFrames.fromFrames (
			sprite.frames, 40, 40, [glowFilter]);
		frame.applyToSprite(sprite,true,true);

	}

}