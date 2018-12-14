package objects;
import adventure.*;
import flixel.util.FlxColor;



class Catcastle extends Object {

    public var built:Bool = false;

    public function new(x,y){
        super (x,y);
        loadGraphic("assets/images/catcastle.png", true,26,33);
        customName = "Cat's Castle";
        animation.add("unboc",[1],3,true);
        animation.play("unboc");
        animation.add("built",[0],3,true);
        layer=BACK;
        ticks = [
                {word:"LOOK", callback:function(){
                    look(); 
                }},
                {word:"USE", callback:function(){
                    use(); 
                }}
            ];
    }
    override function look(){
        var player:Player = room.get(Player);
        if (built == false){
        player.say("Ikea's Cat Castle, I should really get around to assembling it");
        }
        else{
           player.say("Ikea's Cat Castle, looks mighty fine."); 
        }
    }
    override function use(){
        var player:Player = room.get(Player);
        if (built == false){
        player.say("1...2..3 yep got eveything, apart form a screwdriver.");
        }
        else{
            player.say("This is for the cats, not people.");
        }
    }
}
