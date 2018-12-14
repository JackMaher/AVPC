package objects;
import adventure.*;
import flixel.util.FlxColor;



class Twinkbot extends Object {

	public var Twinktalk:Bool = false;
	public var TwinkQuest:Bool = false;

	public function new(x,y){
		super (x,y);
		customName = "Twink Bot";
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
		player.say("I wonder if Adam is still mad about us disabling him and taking his head?");

	}

	override public function use(){
		var player:Player = room.get(Player);
			if(Twinktalk == false){
			var interact = [
			{time:0.0,run:function(){
				player.say("Hello.");
			}},
			{time:3.0,run:function(){
				say("Oh piss off Packwood.");
			}},
			{time:6.0,run:function(){
				player.say("Woah woah woah, I'm I sensing some hostility.");
			}},
			{time:9.0,run:function(){
				say("Well lets see.");
			}},
			{time:12.0,run:function(){
				say("Firstly, You ruined our plan for 'Twink Domination'.");
			}},
			{time:15.0,run:function(){
				say("Secondly, you shot me.");
			}},
			{time:18.0,run:function(){
				say("Thirdly, you took my head and wire me up to this machine.");
			}},
			{time:21.0,run:function(){
				say("Fourthly, Why did you place me in your bedroom in the first place?");
			}},
			{time:24.0,run:function(){
				say("So I can watch your disapointing sex as punishment?");
			}},
			{time:27.0,run:function(){
				say("We had an agreement.");
			}},
			{time:30.0,run:function(){
				say("I gave you information in exchange for you 'saving' me.");
			}},
			{time:33.0,run:function(){
				say("This is not what I had in mind!");
			}},
			{time:36.0,run:function(){
				player.say("To be fair, you where a robot designed to be the perfect twink.");
			}},
			{time:39.0,run:function(){
				player.say("So you could harvest cum from guys and use it to create 'Splunk'.");
			}},
			{time:42.0,run:function(){
				player.say("A soda you was going to use to gain world domination.");
			}},
			{time:45.0,run:function(){
				player.say("The fact we did deactivate you was rather nice of us.");
			}},
			{time:48.0,run:function(){
				player.say("Even after you tried to kill me.");
			}},
			{time:51.0,run:function(){
				player.say("Can't we let bygons be bygons, its Christmas.");
			}},
			{time:54.0,run:function(){
				player.say("And Christmas is about family.");
			}},
			{time:57.0,run:function(){
				player.say("Your apart of our strange family.");
			}},
			{time:60.0,run:function(){
				player.say("So like it or not I want you to festive.");
			}},
			{time:63.0,run:function(){
				player.say("So I'm gonna give you the best christmas gift of all.");
			}},
			{time:66.0,run:function(){
				player.say("Just you wait!");
			}},
			{time:69.0,run:function(){
				say("I'm actually worried about what you're thinking of.");
				Twinktalk = true;
			}},
			];
			Event.run(interact);
		} 
		if (Twinktalk == true && TwinkQuest == false){
			say("I'm still waiting your 'Christmas Gift'");
		}
		if (Twinktalk == true && TwinkQuest == true){
			say("Thank you for letting me be apart of your family this Christmas.");
		}
	}

}