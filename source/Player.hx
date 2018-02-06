package;

import adventure.*;
import flixel.FlxObject;
import flixel.util.FlxColor;

using Effects;

class Player extends Object {

	public var canControl:Bool = true;
	public var customAnimation:String;
	public static var passwordHeard = true;
	public static var spoketoBoss = true;

    public function new(x,y) {
        super(x,y);
        loadGraphic("assets/images/player.png", true,24,30);

        animation.add("lr",[0,1,2,3,4,5],6,true);
        animation.add("idle",[6],0,true);
        animation.add("kneel",[10,11,12,13],6,false);
        animation.add("kneeled",[13],0,false);
        animation.add("standup",[13,12,11,10],6,false);
        customName="Rodger Packwood";
        speechColor = FlxColor.ORANGE;

        maxVelocity.x = 500;
        drag.x = 5000;
        moveSpeed = 8;
        layer=CHAR;

        update(0);
    }

    override public function update(d) {
    	super.update(d);

        width=15*scale.x;
        // if normal way round
		if(!flipX) {
        	offset.x=6*scale.x;
		}
		// if other way round
		else {
			offset.x = 3*scale.x;
		}



    	var movingLeft  = false;
    	var movingRight = false;
    	
    	// Movement code

    	// When there's an automatic movement (from walkToObject)
    	if(move != null) {
    		if(move.x > x) {
	    		animation.play("lr");
    			flipX = true;
    		}
    		else if(move.x < x) {
	    		animation.play("lr");
    			flipX = false;
    		}
    		else {
	    		animation.play("idle");
    		}
    	}

    	// Normal movement
    	else {
	    	if(canControl) {
	            if(flixel.FlxG.keys.anyPressed(["LEFT","A"]))  movingLeft = true;
	            if(flixel.FlxG.keys.anyPressed(["RIGHT","D"])) movingRight = true;
	    	}

	    	if(movingLeft && movingRight) {
	    		movingLeft  = false;
	    		movingRight = false;
	    	}

	    	if(movingLeft) {
	    		if(customAnimation == null) {
	    			animation.play("lr");
	    		}

	    		acceleration.x = -5000;
	    		flipX = false;
	    	}
	    	else if(movingRight) {
	    		if(customAnimation == null) {
	    			animation.play("lr");
	    		}

	    		acceleration.x = 5000;
	    		flipX = true;
	    	}
	    	else {
	    		if(customAnimation == null) {
	    			animation.play("idle");
	    		}

	    		acceleration.x = 0;
	    	}
	    }

	    if(customAnimation != null) {
	    	animation.play(customAnimation);
	    }







    }

}