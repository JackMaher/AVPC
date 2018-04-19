package objects;
import adventure.*;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import rooms.*;

import flixel.FlxG;

class StdDeathTxt extends Object {

    var diedText:FlxText;
    var diedPara:FlxText;
    var clickToContinue:FlxText;
    var visTimer:Float = 0;

    public function new(x,y){
        super (x,y);
        loadGraphic("assets/images/stddeathtxt.png", true,85,32);
        layer=FORE;
        visible = false;
        hidden = true;

        diedText = new FlxText(0,0,500);
        diedText.text = "You should've worn protection";
        diedText.setFormat(null, 18, FlxColor.WHITE,LEFT);
        diedText.visible = false;
        FlxG.state.add(diedText);


        diedPara = new FlxText(0,0,400);
        diedPara.text = "Didn't your mother warn you to wear protection when sleeping with a prostitute to get information on a space adventurer?";
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

        trace("hi");
        if(visible) {
            visTimer += d;
            if(visTimer > 2) {
                trace("vis");
                clickToContinue.visible = true;
                if(FlxG.mouse.justReleased) {
                    // Fade out
                    Global.fader.fadeOut();
                    // Switch to midstate 
                    new FlxTimer().start(2,function(t) {
                        Cutscene.alreadySeen = true;
                        Player.resetVars();
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
