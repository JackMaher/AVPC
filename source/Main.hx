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

<<<<<<< HEAD
	{
		super();
		Global.defaultScaleFactor = 8;
        Global.startingRoom = Hallway1;
		addChild(new FlxGame(1920, 1080, Game));
	}
=======
    {
        super();
        Global.defaultScaleFactor = 8;
        Global.startingRoom = Hallway1;
        addChild(new FlxGame(1920, 1080, OpeningScene));
    }
>>>>>>> origin/master
}

