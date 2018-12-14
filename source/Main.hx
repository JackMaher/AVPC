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
        FlxG.autoPause = false;
        super();
        Global.defaultScaleFactor = 8;
#if true
        Global.startingRoom = Room1;
        Player.spoketoBoss = true;
        Player.passwordHeard = true;
        addChild(new FlxGame(1920, 1080, Game));
#else
        Global.startingRoom = Room1;
        addChild(new FlxGame(1920, 1080, OpeningScene));
#end
    }
}

