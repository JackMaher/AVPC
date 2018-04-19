package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.util.FlxColor;
import flash.filters.*;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxTimer;
import openfl.display.Shader;

class Cutscene extends Room {
    var done = false;
    var floatTime:Float = 0;
    var runTime:Float = 0;
    var toon:Toon;

    var clickToSkip:FlxText;
    public static var alreadySeen:Bool = true;


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

        if(Cutscene.alreadySeen) {
            clickToSkip = new FlxText(0,0,FlxG.width - 30);
            clickToSkip.text = "[ CLICK TO SKIP ]";
            clickToSkip.setFormat("assets/fonts/pixelade.ttf", 40, FlxColor.YELLOW, RIGHT);
            clickToSkip.setBorderStyle(OUTLINE, 0xff000000, 2);
            clickToSkip.y = FlxG.height - 100;
            FlxG.state.add(clickToSkip);
        }

        Global.fader.alpha = 1;
        Global.fader.fadeIn();

        //FlxG.camera.setFilters([new ShaderFilter(toon=new Toon())]);
    }

    function leave() {
        if(clickToSkip != null) {
            FlxG.state.remove(clickToSkip);
        }
    }

    override public function update(d){
        super.update(d);

        // Move the ship and characters around.
        for(i in 1 ... 6) {
            var obj = objects[i];
            obj.offset.y -= Math.sin(floatTime )* room.scaleFactor;
        }
        floatTime += d/2;
        floatTime %= 2*Math.PI;
        for(i in 1 ... 6) {
            var obj = objects[i];
            obj.offset.y += Math.sin(floatTime) * room.scaleFactor;
            obj.x += room.scaleFactor*d/2;
        }

        if(Cutscene.alreadySeen) {
            if(FlxG.mouse.justReleased) {
                Global.fader.fadeOut(1);
                // Switch to midstate 
                new FlxTimer().start(1,function(t) {
                    FlxG.state.remove(clickToSkip);
                    game.switchRoom(Docking); 
                    Global.fader.fadeIn(1);
                });
            } 
        }

        var sodsbury:Sodsbury = get(Sodsbury);
        var rod:Rodgerseat = get(Rodgerseat);
        var ai:CutsceneAI = get(CutsceneAI);

        // Only run stuff past this point one time.
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
                rod.say("Give it a rest Sodsbury.");
            }},
            {time:17.0,run:function(){
                sodsbury.say("Sorry."); //CHANGE
            }},
            {time:21.0,run:function(){
                rod.say("You know what day it is, Luthberge is ");
                rod.say("coming to collect our debt.");
            }},
            {time:25.0,run:function(){
                rod.say("Since our last shipment of top shelf magazinges got busted by");
                rod.say("the Space Police, we have nothing left.");
            }},
            {time:29.0,run:function(){
                rod.say("Well expect for the shirt on my back, and Luthberge would have that too if he could.");
            }},
            {time:32.0,run:function(){
                rod.say("I dont fancy having to give him");
                rod.say("an sponge bath to postpone payment...");
            }},
            {time:37.0,run:function(){
                rod.say("...again.");
            }},
            {time:39.0,run:function(){
                ai.say("Incoming Teleportation Request from...");
            }},
            {time:42.0,run:function(){
                 ai.say("Leonard Luthberg.");
            }},
            {time:44.0,run:function(){
                 ai.say("Do you accept the request?");
            }},
            {time:48.0,run:function(){
                rod.say("Fan-fucking-tastic.");
            }},
            {time:52.0,run:function(){
                ai.say("Sarcasm test fail, accepting postative response.");
            }},
            {time:55.0,run:function(){
                rod.say("no, no, no, NO.");
            }},
            {time:59.0,run:function(){
                sodsbury.say("I should really get round to fixing that.");
                rod.say("Oh bollocks.");
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
        hidden = true;
        layer=FORE;
    }

}

class CutsceneWindow extends Object {

    public function new(x,y){
        super (x,y);
        hidden = true;
        layer=FORE;
    }
}



class CutsceneAI extends Object {

    public function new(x,y){
        super (x,y);
        hidden = true;
        layer=FORE;
        speechColor = FlxColor.RED;
    }
}

