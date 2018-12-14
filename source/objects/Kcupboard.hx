package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.FlxG;

class Kcupboard extends Object {

    var taken : Bool = false;

    public function new(x,y){
        super (x,y);
        customName = "Box of Stuff";
        loadGraphic("assets/images/cupboard.png", true,11,7);
        layer=BACK;

        ticks = [
        {word:"SEARCH", callback:use},
        {word:"LOOK",callback:look}
        ];
    }

    override function use(){
        var player:Player = room.get(Player);
        if (taken == false){
        Global.inventory.add(new Screwdriver(-1000,20) );
        taken = true;
        }
        else{
            player.say("Just asorted spices and poppers.");
        }
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("Authentic Wooden Cupboard made from Wood from Semga9.");
    }


}
