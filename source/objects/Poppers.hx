package objects;
import adventure.*;
import flixel.util.FlxColor;



class Poppers extends Object {

	var currentPopperNum = -1;
	var popperList:Array<PopperPills>;
	public static var taken:Bool = false;

	public function new(x,y){
		super (x,y);
		customName = "Shelf";
		layer=BACK;
		ticks = [
	            {word:"SEARCH", callback:function(){
	                look(); 
	            }},
	            {word:"TAKE", callback:function(){
	                use(); 
	            }},
            ];


		popperList = [ 
			new GlitterPoppers(),
			new PinefreshPoppers(),
			new ApplePoppers(), 
			new CherryPoppers(),
			new SourcreamAndOnionPoppers(),
			new OldspicePoppers(),
		];

	}
	
	override function look(){

		currentPopperNum++;
		currentPopperNum %= popperList.length;


		var player:Player = room.get(Player);

		if( taken == true) {
			player.say("I already have some of those. I can put them back though...");
			return;
		}
		player.say(popperList[currentPopperNum].line());

	}

	override function use() {

		var player:Player = room.get(Player);

		if(currentPopperNum == -1) {
			player.say("What should I take from here?");
			return;
		}

		if(taken == true) {
			player.say("I already have some of those. I can put them back though...");
			return;
		}
		Global.inventory.add(popperList[currentPopperNum]);
		popperList[currentPopperNum].activate();
		taken = true;
		hidden = false;

	}


}

class PopperPills extends Object {
	function new() {
		hidden = true;
		super(-10000,0);
		changeScale(3);
		visible = false;
	}

	public function line():String { return "Generic poppers."; } 

	override function useOn(o:Object) {


		var player:Player = room.get(Player);

		if(o.type == Poptwink){
			var interact = [
			{time:0.0,run:function(){
				o.say("Take a huff, join us.", null, 4);
			}},
			];
			Event.run(interact, false);
		}

			if(o.type == Poptwink1){
			var interact = [
			{time:0.0,run:function(){
				player.say("Guy's eyes seem completely glazed over.", null, 4);
			}},
			];
			Event.run(interact, false);
		}
			if(o.type == Drinktwink){
			var interact = [
			{time:0.0,run:function(){
				o.say("Sorry Packwood, but I'm not into that sort of stuff.", null, 4);
			}},
			];
			Event.run(interact, false);

		}
			if(o.type == LiftAI){
			var interact = [
			{time:0.0,run:function(){
				o.say("You're just taunting me now, how do you expect me to sniff that.", null, 4);
			}},
			];
			Event.run(interact, false);

		}
			if(o.type == SitTwink){
			if(type ==ApplePoppers){
				var interact = [
				{time:0.0,run:function(){
					player.say("I'd rather throw an apple at him.", null, 4);
				}},
				];
				Event.run(interact, false);
			}
			
		}else { if(o.type == SitTwink){
			var interact = [
			{time:0.0,run:function(){
				o.say("Can't you take a hint? LEAVE. US. ALONE.", null, 4);
			}},
			];
			Event.run(interact, false);
			
		}}
			if(o.type == SitTwink2){
			var interact = [
			{time:0.0,run:function(){
				player.say("He already reeks of his father disapointment already.", null, 4);
			}},
			];
			Event.run(interact, false);
			
		}
			if(o.type == PTwink1){
			var interact = [
			{time:0.0,run:function(){
				o.say("Why are you even trying with me?", null, 4);
			}},
			];
			Event.run(interact, false);
			
		}
			if(o.type == PTwink2){

				if(type == PinefreshPoppers){
		var interact = [
			{time:0.0,run:function(){
				o.say("Awh man, is that Pine Fresh I smell?", FlxColor.CYAN, 4);
			}},
			{time:4.0,run:function(){
				player.say("Do you want them? I'll need something in return?",null , 4);
			}},
			{time:8.0,run:function(){
				o.say("Meet me in the bathroom in 10 minutes, bring the poppers", FlxColor.CYAN, 4);
			}},
			{time:12.0,run:function(){
				player.say("What no? I just want information.",null, 4);
			}},
			{time:16.0,run:function(){
				o.say("Oh thats it? Sure shoot.", FlxColor.CYAN, 4);
			}},
			{time:20.0,run:function(){
				player.say("What do you know about Lena?",null, 4);
			}},
			{time:24.0,run:function(){
				o.say("Do you mean Lucas Lena? I dont know much about him", FlxColor.CYAN, 4);
			}},
			{time:28.0,run:function(){
				o.say("All I know that he was real friendly with Maxx Cream", FlxColor.CYAN, 4);
			}},
			{time:32.0,run:function(){
				o.say("I'm sure he can give you more infomation.", FlxColor.CYAN, 4);
			}},
			{time:36.0,run:function(){
				o.say("Can I have them now?", FlxColor.CYAN, 4);
			}},
			{time:40.0,run:function(){
				player.say("Sure, enjoy.",null, 4);
				player.customAnimation = "kneel";
				player.afterAnimation (function(){			
					player.customAnimation = "standup";
					player.afterAnimation (function(){player.customAnimation = null;});
					Global.inventory.remove(this);
					Player.poppersComplete = true;
				});
			}},
			{time:44.0,run:function(){
				o.say("-SNIFF-", FlxColor.CYAN, 2);
			}},
			{time:48.0,run:function(){
				o.say("Thats the good stuff, you sure you dont want me to show my apperaction in the bathroom?", FlxColor.CYAN, 4);
			}},
			{time:52.0,run:function(){
				player.say("Yeah, I'll think I'll pass.", null , 3);
			}},
			{time:56.0,run:function(){
				o.say("Whatever your loss -SNIFF-", FlxColor.CYAN, 2);
			}},
		];

	  	player.walkToObject(PTwink2, X, RIGHT, function(){
			player.flipX = false;
			Event.run(interact, false);
		});

	  }else{
			var interact = [
			{time:0.0,run:function(){
				o.say("Apple? too sour for me, I need something more rustic man.", null, 4);
			}},
			];
			Event.run(interact, false);
			
		}}
			if(o.type == PTwink3){
			var interact = [
			{time:0.0,run:function(){
				o.say("No chance in hell mate.", null, 4);
			}},
			];
			Event.run(interact, false);
			
		}
			if(o.type == Nathan){
			var interact = [
			{time:0.0,run:function(){
				o.say("Mmmphhh.", null, 4);
			}},
			];
			Event.run(interact, false);
			
		}
			if(o.type == MaxxCream){
			var interact = [
			{time:0.0,run:function(){
				o.say("I already have some.", null, 4);
			}},
			];
			Event.run(interact, false);
			
		}
			if(o.type == Boss){
			var interact = [
			{time:0.0,run:function(){
				o.say("Why dont you use them Packwood, it might make you more of a barable person.", null, 4);
			}},
			];
			Event.run(interact, false);
			
		}
			if(o.type == Player){
			var interact = [
			{time:0.0,run:function(){
				player.say("*SNIFF* Oh God. I dont feel good.", null, 4);
				Global.inventory.remove(this);
				Poppers.taken = false;
			}},
			];
			Event.run(interact, false);
			
		}

		if(o.type == Poppers) {
			Global.inventory.remove(this);
		}
	}

	override public function kill() {
		visible = false;
		Poppers.taken = false;
		hidden = true;
	}
	public function activate(){
		visible = true;
		Poppers.taken = true;
		hidden = false;

	}


}

class ApplePoppers extends PopperPills {
	function new (){
		super();
		customName = "Apple Poppers";
	}

	override public function line() {
		return "Ooh, the new apple flavour";
	}



}

class CherryPoppers extends PopperPills {

	function new (){
		super();
		customName = "Cherry Poppers";
	}


	override public function line() {
		return "Cherry Flavoured Poppers - use this cherry to pop your cherry";
	}
}

class PinefreshPoppers extends PopperPills {
	function new (){
		super();
		customName = "Pine Fresh Poppers";
	}

	override public function line() {
		return "Ooh, piney";
	}
	


}

class SourcreamAndOnionPoppers extends PopperPills {

	function new (){
		super();
		customName = "Sour Cream and Onion Poppers";
	}
	

	override public function line() {
		return "Sour cream and Onion Poppers - Once you pop, you just can't stop.";
	}

}

class OldspicePoppers extends PopperPills {

	function new (){
		super();
		customName = "Oldspice Poppers";
	}
	

	override public function line() {
		return "Old Spice, for when you want the smell of a 14 year old up your nose";
	}

}

class GlitterPoppers extends PopperPills {

	function new (){
		super();
		customName = "Glitter Poppers";
	}
	override public function line() {
		return "For the smell of your fathers disapoint try Glitter Poppers.";
	}

}