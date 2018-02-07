package;

import flixel.FlxGame;
import openfl.Lib;
import openfl.display.Sprite;
import flixel.FlxG;

import adventure.*;
import rooms.*;

class Main extends Sprite
{
	public function new()

	{
		super();
		Global.defaultScaleFactor = 8;
        Global.startingRoom = Bar;
		addChild(new FlxGame(1920, 1080, Game));
	}
}

