package rooms;

import adventure.*;
import objects.*;
import rooms.*;

class Cutscene extends Room {
    override public function create() {
        //scaleFactor = 8;
        objects = [
        		new Sodsbury(43,33),
        		new Player(0,0),
        		new CutsceneFore(0,0),
        ];

    	Global.fader.alpha = 1;
    	Global.fader.fadeIn();

    }

}

class CutsceneFore extends Object {

    public function new(x,y){
        super (x,y);
        customName = " ";
        layer=FORE;
    }
}