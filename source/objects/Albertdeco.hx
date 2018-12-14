package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.FlxG;

class Albertdeco extends Object {

    var taken : Bool = false;

    public function new(x,y){
        super (x,y);
        customName = "Bedside Table";
        loadGraphic("assets/images/albertdeco.png", true,12,13);
        layer=BACK;

        ticks = [
        {word:"SEARCH", callback:use},
        {word:"LOOK",callback:look}
        ];
    }

    override function use(){
        var player:Player = room.get(Player);
        if (taken == false){
        Global.inventory.add(new Baubles(-1000,20) );
        taken = true;
        }
        else{
            player.say("Nothing Christmassy left.");
        }
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("Box of asorted... 'toys' and other items");
    }


}
