package objects;
import adventure.*;
import flixel.util.FlxColor;



class Pool extends Object {

 	var steams:Array<Steam> = [];
    var t:Float = 0;

	public function new(x,y){
		super (x,y);
		hidden = true;

        for(i in 0...20) {
            var s = new Steam(); 
            
            steams.push(s);
        };

	}

	override public function update(d) {
        super.update(d);
        t+=d;
        var newt:Int = cast Math.floor(t*4);
        if(newt > 20) return;
        for(i in 0...newt) {
            if(!steams[i].on) {
                steams[i].activate();
                room.addObject(steams[i]);
            }
        }
        layer = BACK;
        layer = FORE;

    }
	
}

class Steam extends Object {

    public var on = false;
    public var t:Float = 0;

    public function new() {
        super(0,0);
        setup();
        hidden = true;
        visible = false;
        layer = FORE;
    }
    function setup() {
        x = roomPos(Math.random()*44 + 69, 51).x;
        y = roomPos(Math.random()*44 + 69, 51).y;
        alpha=Math.random();

        var s = (Math.random()*0.5+0.5)*room.scaleFactor;
        scale.set(s,s);
    }

    public function activate() {
        on = true;
        visible = true;
    }

    override public function update(d) {
        super.update(d);
        if(!on) return;

        t += d*2;
        t %= Math.PI*2;
        offset.x = Math.sin(t)*20;

        y --;

        alpha -= d/5;
        if(alpha <= 0) {
            setup();
        }
    }
}