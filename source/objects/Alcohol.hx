package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.FlxG;

class Alcohol extends Object {

    var taken : Bool = false;

    public function new(x,y){
        super (x,y);
        customName = "Assorted Alcohol";
        loadGraphic("assets/images/alcohol.png", true,12,9);
        layer=BACK;

        ticks = [
        {word:"TAKE", callback:use},
        {word:"LOOK",callback:look}
        ];
    }

    override function use(){
        var player:Player = room.get(Player);
        if (taken == false){
        Global.inventory.add(new Wine(-1000,20) );
        taken = true;
        }
        else{
            player.say("Just your typical booze selection");
        }
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("Alcohol from all across the galaxy.");
    }


}
