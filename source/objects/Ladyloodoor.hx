package objects;
import adventure.*;
import flixel.util.FlxColor;



class Ladyloodoor extends Object {

	public static var open:Bool = false;

	public function new(x,y){
		super (x,y);
		loadGraphic("assets/images/ladyloodoor.png", true,50,32);
        animation.add("closed",[0],0,false);
        animation.add("open",[0,1,2,3,4],10,false);
        animation.play("closed");
        customName = "Ladies Loo";
		ticks = [
	            {word:"ENTER", callback:function(){
	                use(); 
	            }},
            ];
	}

	override function use(){

		animation.play("open");
		afterAnimation(function(){
			open = true;
		});

	}
}