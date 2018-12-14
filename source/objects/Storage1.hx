
package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.FlxG;

class Storage1 extends Object {

    var taken : Bool = false;

    public function new(x,y){
        super (x,y);
        customName = "Storage";
        loadGraphic("assets/images/storage1.png", true,34,17);
        layer=BACK;

        ticks = [
        {word:"SEARCH", callback:use},
        {word:"LOOK",callback:look}
        ];
    }

    override function use(){
        var player:Player = room.get(Player);
        if (taken == false){
        Global.inventory.add(new Gifts(-1000,20) );
        player.say("Ah ha! This is where I hid away the gifts.");
        taken = true;
        }
        else{
            player.say("Filled with nick nacks");
        }
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("Plain everyday box.");
    }


}
