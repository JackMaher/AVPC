package rooms;

import adventure.*;
import objects.*;
import rooms.*;

class Penthouse extends Room {
	var nudedone = false;
    override public function create() {
       // scaleFactor = 8;
        objects = [
					new RoomTrigger(6,PenthouseHallway,60,10),
					//new Penlift(29,8),
					new Waterfall(115,11),
					new Waterfall(90,11),
					new Boss(84,15),
					new Curtine(76,1),
					new Block(85),
                    new Dispendershead(67,26),
                    new Dispendersbody(66,30),
                    new Shagrug(25,39),
                    new Plant(58,5),
                    new Dvd(16,15),
        			new Player(10,10)];
    }

    override public function update(d){
        super.update(d);
        if (nudedone){
            return;
        }
        if(Player.clothed == false){
            var boss:Boss = get(Boss);
            boss.say("Thats not want I to clear your debt... this time.");
            nudedone = true;
        }

    }

}


class Shagrug extends Object {

    public function new(x,y){
        super (x,y);
        customName = "Shag Carpet";
        layer=FORE;
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("Nothing says class more than a shag carpet.");
    }
}
class Plant extends Object {

    public function new(x,y){
        super (x,y);
        customName = "Potted Plant";
        layer=BACK;
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("Tall and proud Morning Glory Tree.");
    }
}
class Dvd extends Object {

    public function new(x,y){
        super (x,y);
        customName = "Shelf";
        layer=BACK;
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("This shelf is filled with porno's, none of my work though.");
    }
}

class Curtine extends Object {

    public function new(x,y){
        super (x,y);
        hidden = true;
        layer=FORE;
    }
}