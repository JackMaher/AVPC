package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.text.FlxText;

import flixel.FlxG;



class Loodeath extends Object {

    var diedText:FlxText;
    var diedPara:FlxText;

    public function new(x,y){
        super (x,y);
        hidden = true;
        loadGraphic("assets/images/loodeath.png", true,85,32);
        layer=FORE;
        visible = false;
        hidden = true;

        diedText = new FlxText(0,0,500);
        diedText.text = "Guess they havent added that.";
        diedText.setFormat(null, 18, FlxColor.WHITE,LEFT);
        diedText.visible = false;
        FlxG.state.add(diedText);


        diedPara = new FlxText(0,0,400);
        diedPara.text = "Due to building regulations Luthberge had to put in a ladies loo, but the regulations didnt state it had to lead anywhere.";
        diedPara.setFormat(null, 18, FlxColor.BLACK,LEFT);
        diedPara.visible = false;
        FlxG.state.add(diedPara);
    }

    public function activate() {
        visible = true;
        //make diedText visible as well
        diedText.visible = true;
        diedPara.visible = true;

        // set the position of diedText
                                // scaled units!
        diedText.x = this.x + (33 * room.scaleFactor);
        diedText.y = this.y + (4 * room.scaleFactor);

        diedPara.x = this.x + (33 * room.scaleFactor);
        diedPara.y = this.y + (10 * room.scaleFactor);

    }

}
