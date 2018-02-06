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
			new ApplePoppers(), 
			new PinefreshPoppers(),
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

class PinefreshPoppers extends PopperPills {

	override public function line() {
		return "Ooh, piney";
	}

}