package;

import adventure.*;
import flixel.FlxObject;
import flixel.util.FlxColor;

using Effects;

class Player extends Object {

	public var canControl:Bool = true;
	public static var clothed:Bool = true;
	public var customAnimation:String;
	public static var passwordHeard = false;
	public static var spoketoBoss = false;
    public static var poppersComplete = false;
    public static var condomOn = false;
    public static var maxxSex = false;
    public static var std = false;
    public static var complete = false;

    public function new(x,y) {
        super(x,y);
        loadGraphic("assets/images/player.png", true,24,30);

        animation.add("lr",[0,1,2,3,4,5],6,true);
        animation.add("std",[25,26,27,28,29,30,31],6,false);
        animation.add("teleyIn",[38,38,38,38,38,32,33,34,35,36,37],6,false);
        animation.add("teleyOut",[37,36,35,34,33,32,38,38,38,38],6,false);
        animation.add("stdIdle",[31],0,false);
        animation.add("nakedLR",[19,20,21,22,23,24],6,true);
        animation.add("nakedIdle",[18],0,true);
        animation.add("undress",[10,11,12,13,14,15,16,17],8, false);
        animation.add("redress",[17,16,15,14,13,12,11,10],8, false);
        animation.add("idle",[6],0,true);
        animation.add("kneel",[10,11,12,13],6,false);
        animation.add("kneeled",[13],0,false);
        animation.add("standup",[13,12,11,10],6,false);
        customName="Rodger Packwood";
        speechColor = FlxColor.ORANGE;

        maxVelocity.x = 400;
        drag.x = 5000;
        moveSpeed = 480;
        layer=CHAR;
        pixelPerfect = true;


        update(0);
    }

    override public function use(){
    	if (clothed == true){
    		clothed =false;
    		customAnimation = "undress";
    		canControl = false;
            Global.canInteract = false;
    		afterAnimation(function(){customAnimation= null; canControl= true; Global.canInteract = true;});
    		
    	}
    	else{
    		clothed = true;
       		customAnimation = "redress";
            Global.canInteract = false;
       		canControl = false;
    		afterAnimation(function(){customAnimation= null; canControl= true; Global.canInteract = true;});
    	}
    }

    override public function walkTo(rawX, rawY, ?then:Null<Void->Void>) {
        velocity.x = 0;
        acceleration.x = 0;
        super.walkTo(rawX,rawY,then);
    }

    override public function update(d) {
    	super.update(d);

        width=7*scale.x;
        
        // if normal way round
		if(!flipX) {
        	offset.x=6*scale.x;
		}
		// if other way round
		else {
			offset.x = 10*scale.x;
		}



    	var movingLeft  = false;
    	var movingRight = false;
    	
    	// Movement code

    	// When there's an automatic movement (from walkToObject)
    	if(move != null) {
    		if(move.x > x) {
	    		animation.play(if(clothed) "lr" else "nakedLR");
    			flipX = true;
    		}
    		else if(move.x < x) {
	    		animation.play(if(clothed) "lr" else "nakedLR");
    			flipX = false;
    		}
    		else {
	    		animation.play(if(clothed) "idle" else "nakedIdle");
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
	    			animation.play(if(clothed) "lr" else "nakedLR");
	    		}

	    		acceleration.x = -5000;
	    		flipX = false;
	    	}
	    	else if(movingRight) {
	    		if(customAnimation == null) {
	    			animation.play(if(clothed) "lr" else "nakedLR");
	    		}

	    		acceleration.x = 5000;
	    		flipX = true;
	    	}
	    	else {
	    		if(customAnimation == null) {
	    			animation.play(if(clothed) "idle" else "nakedIdle");
	    		}

	    		acceleration.x = 0;
	    	}
	    }

	    if(customAnimation != null) {
	    	animation.play(customAnimation);
	    }









    }

}