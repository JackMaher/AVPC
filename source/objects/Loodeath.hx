package objects;
import adventure.*;
import rooms.*;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

import flixel.FlxG;



class Loodeath extends Object {

    var diedText:FlxText;
    var diedPara:FlxText;
    var clickToContinue:FlxText;
    var visTimer:Float = 0;

    public function new(x,y){
        super (x,y);
        hidden = true;
        loadGraphic("assets/images/loodeath.png", true,85,32);
        layer=FORE;
        visible = false;

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

        clickToContinue = new FlxText(0,0,FlxG.width-30);
        clickToContinue.text = "[ CLICK TO CONTINUE ]";
        clickToContinue.setFormat("assets/fonts/pixelade.ttf", 40, FlxColor.YELLOW, RIGHT);
        clickToContinue.setBorderStyle(OUTLINE, 0xff000000, 2);
        clickToContinue.visible =false;
        FlxG.state.add(clickToContinue);
    }
    override public function update(d) {
        super.update(d);

        if(visible) {
            visTimer += d;
            if(visTimer > 2) {
                clickToContinue.visible = true;
                if(FlxG.mouse.justReleased) {
                    // Fade out
                    Global.fader.fadeOut();
                    // Switch to midstate 
                    new FlxTimer().start(2,function(t) {
                        Cutscene.alreadySeen = true;
                        Player.resetVars();
                        Ladyloodoor.open = false;
                        Global.rooms = new Map();
                        FlxG.state.remove(diedText);
                        FlxG.state.remove(diedPara);
                        FlxG.state.remove(clickToContinue);
                        game.switchRoom(Cutscene); 
                    });
                }
            }
        }

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

        clickToContinue.y = FlxG.height - 100;

    }

}
