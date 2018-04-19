package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.FlxG;

class Hal extends Object {

    public function new(x,y){
        super (x,y);
        customName = "Hal 80085";
        layer=FORE;

        ticks = [
        {word:"LOOK", callback:look}
        ];
    }

    override function look(){
        say("Hello Dave. Umm I mean Packwood.",FlxColor.RED,4);
        //Global.inventory.add(this);
        //Global.inventory.add(new ReusableProphylactic(-1000,20) );
    }


}
