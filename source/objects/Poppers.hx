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


		popperList = [ 
			new PinefreshPoppers(),
			new ApplePoppers(), 
			new CherryPoppers(),
			new SourcreamAndOnionPoppers(),
			new OldspicePoppers(),
			new GlitterPoppers(),
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
		popperList[currentPopperNum].visible = true;
		taken = true;

	}


}

class PopperPills extends Object {
	function new() {
		super(-10000,0);
		changeScale(4);
		visible = false;
	}

	public function line():String { return "Generic poppers."; } 

	override function useOn(o:Object) {
		if(o.type == Poppers) {
			Global.inventory.remove(this);
			Poppers.taken = false;
		}
	}

	override public function kill() {
		visible = false;
	}


}

class ApplePoppers extends PopperPills {

	override public function line() {
		return "Ooh, the new apple flavour";
	}


}

class CherryPoppers extends PopperPills {

	override public function line() {
		return "Cherry Flavoured Poppers - use this cherry to pop your cherry";
	}
}

class PinefreshPoppers extends PopperPills {

	override public function line() {
		return "Ooh, piney";
	}
	override public function useOn(o:Object){
		super.useOn(o);
		var player:Player = room.get(Player);

		if(o.type == PTwink2){
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
					Poppers.taken = false;
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

	  }

	}


}

class SourcreamAndOnionPoppers extends PopperPills {

	override public function line() {
		return "Sour cream and Onion Poppers - Once you pop, you just can't stop.";
	}

}

class OldspicePoppers extends PopperPills {

	override public function line() {
		return "Old Spice, for when you want the smell of a 14 year old up your nose";
	}

}

class GlitterPoppers extends PopperPills {

	override public function line() {
		return "For the smell of your fathers disapoint try Glitter Poppers.";
	}

}