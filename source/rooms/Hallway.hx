package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.FlxG;


class Hallway extends Room {
    var nudedone = false;
    override public function create() {
        //scaleFactor = 8;
        objects = [
        			new Player(10,10),
                    new RoomTrigger(6,Room1,110,17),
                    new RoomTrigger(120,Cockpit,17,36),
                    new Hallfore1(0,0),
                    new Doorbedroom(32,34),
                    new Sodsbury(75,48),
                    new Airvent(74,32)];
                    //FlxG.timeScale = 2;
        			 
    }
    public function enter(){
            var sods = room.get (Sodsbury);
            if (Sodsbury.CatCome == true){
                sods.hidden = true;
                sods.visible = false;
            }
            

            if(sods.SodSpoke == false){
            var interact = [
            {time:0.0,run:function(){
                sods.say("Come on you bloody bastards.");
            }},
            {time:3.0,run:function(){
                sods.say("Get out down from there!");
                sods.SodSpoke = true;
            }},
            ];
            Event.run(interact);

        }
    }
}

class Hallfore1 extends Object {

    public function new(x,y){
        super(x,y);
        customName = " ";
        layer=FORE;
    }
}

class Airvent extends Object {

    public function new(x,y){
        super(x,y);
        customName = "Air Vent";
        layer=BACK;
    }

}
