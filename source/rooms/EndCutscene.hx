package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.util.FlxColor;

class EndCutscene extends Room {
    var done = false;
    override public function create() {
        x=0;
        y=0;
        


        objects = [
                new Spacestation(124,52),
                new Rodgerseat(123,53),
                new Sodsbury(119,63),
                new Cruisingship(34,37),
                new Cruisingshipwindow(34,37),
                
        ];

    	Global.fader.alpha = 1;
    	Global.fader.fadeIn();

    }
    override public function update(d){
        var rod:Rodgerseat = get(Rodgerseat);
        var sodsbury:Sodsbury = get(Sodsbury);
        super.update(d);


            if(done) return;
            done = true;
        var outro = [
            {time:0.0,run:function(){
                rod.animation.play("teleyin");

            }},          
            {time:1.0,run:function(){
                rod.say("owwww");
            }},
            {time:5.0,run:function(){
                sodsbury.say("Where the hell have you been?");
            }},
            {time:9.0,run:function(){
                sodsbury.say("I've been man-handled, pushed about, and dumped on this dump of a ship.",null, 5);
            }},
            {time:14.0,run:function(){
                sodsbury.say("What happen to our ship, and why are we on this floating STD?");
            }},
            {time:18.0,run:function(){
                rod.say("I'll tell you on the way, set fly path to 'Gomorrah 9' we have someone to meet.");
            }},

        ];
        Event.run(outro, false);
    }

}


class Cruisingship extends Object {

    public function new(x,y){
        super (x,y);
        hidden = true;
        layer=FORE;
    }
}
class Cruisingshipwindow extends Object {

    public function new(x,y){
        super (x,y);
        hidden = true;
        layer=FORE;
    }
}
