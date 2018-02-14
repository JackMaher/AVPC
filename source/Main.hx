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
#if false
        Global.startingRoom = Docking;
        Player.spoketoBoss = true;
        Player.passwordHeard = true;
        addChild(new FlxGame(1920, 1080, Game));
#else
        Global.startingRoom = Cutscene;
        addChild(new FlxGame(1920, 1080, MenuState));
#end
    }
}

