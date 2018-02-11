package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.util.FlxColor;

class Cutscene extends Room {
    var done = false;
    override public function create() {
        x=0;
        y=0;
        


        objects = [
                new Spacestation(124,52),

                new Rodgerseat(72,48),
                new CutsceneAI(45,10),
                new Sodsbury(71,54),
                new CutsceneFore(1,0),
                new CutsceneWindow(1,0)
                
        ];

    	Global.fader.alpha = 1;
    	Global.fader.fadeIn();

    }
    override public function update(d){
        super.update(d);
        var sodsbury:Sodsbury = get(Sodsbury);
        var rod:Rodgerseat = get(Rodgerseat);
        var ai:CutsceneAI = get(CutsceneAI);
            if(done) return;
            done = true;

        var intro = [

        {time:2.0,run:function(){
            sodsbury.say("Duuh duuh da da da duuh");

        }},
        {time:6.0,run:function(){
            sodsbury.say("duuh da da da duuh duuh");

        }},
        {time:10.0,run:function(){
            sodsbury.say("dun-dun-dun-duuuuh");
        }},
        {time:13.0,run:function(){
            rod.say("For the love that is all and holy Sodsbury shut up.");
        }},
        {time:17.0,run:function(){
            sodsbury.say("Who oiled in your cornflakes?");
        }},
        {time:21.0,run:function(){
            rod.say("You know what day it is, Luthbergeis ");
            rod.say("coming to collect our debt.");
        }},
       {time:25.0,run:function(){
            rod.say("Since our last shipment of Porno got busted by");
            rod.say("the Police, we have nothing.");
        }},
       {time:29.0,run:function(){
            rod.say("NOTHING!");
        }},
       {time:32.0,run:function(){
            rod.say("And I dont want to have to give him");
            rod.say("another sponge bath again for payment.");
        }},
       {time:37.0,run:function(){
            ai.say("Incoming Teleportation Request from...");
        
        }},
       {time:40.0,run:function(){
            ai.say("Leonard Luthberg");
        
        }},
       {time:44.0,run:function(){
            ai.say("Do you accept the request?");
        
        }},
       {time:48.0,run:function(){
            rod.say("Fan-fucking-tastic.");
        
        }},
       {time:52.0,run:function(){
            ai.say("sarcasm test fail, accepting postative response");
        
        }},
       {time:55.0,run:function(){
            rod.say("no, no, no, NO.");
        
        }},
       {time:59.0,run:function(){
            sodsbury.say("I should really fix that.");
            rod.say("OWWWWWWWWWWW");
            rod.animation.play("teley");
            rod.afterAnimation (function(){
                         game.switchRoom(Docking);
                     });
        
        }},
       {time:63.0,run:function(){
            sodsbury.say("Duuh duuh da da da duuh");
        
        }},
        ];
        Event.run(intro, false);
    }

}

class CutsceneFore extends Object {

    public function new(x,y){
        super (x,y);
        customName = " ";
        layer=FORE;
    }
}

class CutsceneWindow extends Object {

    public function new(x,y){
        super (x,y);
        customName = " ";
        layer=FORE;
    }
}



class CutsceneAI extends Object {

    public function new(x,y){
        super (x,y);
        customName = " ";
        layer=FORE;
        speechColor = FlxColor.RED;
    }
}

