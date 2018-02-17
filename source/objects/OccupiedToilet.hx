package objects;
import adventure.*;
import flixel.FlxG;
import flixel.util.FlxColor;

class OccupiedToilet extends Object {

	public function new(x,y){
		super (x,y);
		customName = "Stall";
		speechColor = FlxColor.LIME;
		ticks = [
	            {word:"USE", callback:function(){
	              	look(); 
	            }},
            ];
	}
	override function look(){


		var player:Player = room.get(Player);
		var roomX = room.getX(75);
		var roomY = room.getY(16);

		var interact = [

			{time:0.0,run:function(){
					say("Mate it's occupied", FlxColor.GREEN, 2);
				
			}},
			{time:2.0,run:function(){
				say("Yeah bugger off", FlxColor.WHITE,2);
			}}
		];

		player.walkTo(roomX, roomY, function(){
			player.flipX = true;
			Event.run(interact);
			});

		};
	}
