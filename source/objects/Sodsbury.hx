package objects;
import adventure.*;
import flixel.util.FlxColor;



class Sodsbury extends Object {
	public static var CatCome:Bool = false;
	var SodSpoke:Bool = false;
	var CatQuest: Bool = false;

	public function new(x,y){
		super (x,y);
        loadGraphic("assets/images/sodsbury.png", true,10,14);
        animation.add("float",[0,1,2,3,6,5],6,true);
        animation.add("SodFes",[7,8,9,10,11],6,true);
        animation.play("float");
		customName = "Sodsbury";
		layer=BACK;
		        ticks = [
            {word:"LOOK", callback:function(){
                look(); 
            }},
            {word:"TALK", callback:function(){
                use(); 
            }}
        ];


	}

	override public function look(){
		var player:Player = room.get(Player);
		player.say("What is he doing?");

	}

	override public function use(){
		var player:Player = room.get(Player);
		if (SodSpoke == true && CatQuest == false){
        	var interact = [
			{time:0.0,run:function(){
				player.say("Who are you talking too Sods?");
			}},
			{time:3.0,run:function(){
				say("Your bloody cats.");
			}},
			{time:6.0,run:function(){
				say("They've crawled into the vent in protest.");
			}},
			{time:9.0,run:function(){
				player.say("In protest of what?");
			}},
			{time:12.0,run:function(){
				say("Of the Ikea 'Cat Castle' that you got them.");
			}},
			{time:15.0,run:function(){
				player.say("Whats wrong about it? Ungreatful.");
			}},
			{time:18.0,run:function(){
				say("You havent assumbled it yet, and its been 4 months.");
			}},
			{time:21.0,run:function(){
				say("They wont come down until their demands have been met.");
				CatQuest = true;
			}},
			];
			Event.run(interact);
		}
		if(CatQuest == true && Catcastle.built == true && CatCome == false){
			var interact = [
			{time:0.0,run:function(){
				player.say("Their demands have been met.");
			}},
			{time:3.0,run:function(){
				say("Nothing good will come to meeting the terrorists demands.");
				Sodsbury.CatCome = true;
			}},
			];
			Event.run(interact);

		}
		if(CatCome == true){
			var interact = [
			{time:0.0,run:function(){
				say("Ho Ho Ho!");
			}},
			];	
			Event.run(interact);		
		}

	}

}