package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.text.FlxText;

import flixel.FlxG;



class StdDeathTxt extends Object {

    var diedText:FlxText;

    public function new(x,y){
        super (x,y);
        customName = " ";
        loadGraphic("assets/images/stddeathtxt.png", true,85,32);
        layer=FORE;
        visible = false;

        diedText = new FlxText(0,0,500);
        diedText.text = "YOU DIED";
        diedText.setFormat(null, 18, FlxColor.WHITE,LEFT);
        diedText.visible = false;
        FlxG.state.add(diedText);
    }

    public function activate() {
        visible = true;
        //make diedText visible as well
        diedText.visible = true;

        // set the position of diedText
                                // scaled units!
        diedText.x = this.x + (35 * room.scaleFactor);
        diedText.y = this.y + (4 * room.scaleFactor);

    }

}
