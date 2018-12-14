package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.FlxG;

class Underthebed extends Object {

    var taken : Bool = false;

    public function new(x,y){
        super (x,y);
        customName = "Under the Bed";
        loadGraphic("assets/images/underthebed.png", true,7,2);
        layer=BACK;

        ticks = [
        {word:"SEARCH", callback:use},
        {word:"LOOK",callback:look}
        ];
    }

    override function use(){
        var player:Player = room.get(Player);
        if (taken == false){
        Global.inventory.add(new CD(-1000,20) );
        taken = true;
        }
        else{
            player.say("Only sticky tissuses left.");
        }
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("There is something under there, hidden within the dirty tissuses.");
    }


}
