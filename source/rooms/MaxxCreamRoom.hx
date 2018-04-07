package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.FlxG;
import flixel.util.FlxColor;

class MaxxCreamRoom extends Room {
    override public function create() {
       // scaleFactor = 8;
        objects = [
					//new RoomTrigger(6,Bar,130,21),
					new MaxxCream(85,10),
					new MaxDoor(21,8),
					new Block(146),
					new Block(6),
					new Camera(11,1),
					new MaxLight(62,2),
					new CutTrigger(145),
					new MaxTrigger(20),
					new SexScene(123,10),
        			new Player(10,10),
        			new MaxBar(138,16)];

        			
        			var player:Player = get(Player);
        			player.flipX = true;
        			//FlxG.timeScale = 2;
    }


}

class MaxTrigger extends Trigger{
	var done:Bool = false;

	function trigger(){
		if (done){
			return;
		}
		if(Player.clothed == false){
			var max:MaxxCream = room.get(MaxxCream);
			max.say("You're an eager one.");
			done = true;
		}
	}


}


class CutTrigger extends Trigger{
	var clothesLine:Bool = false;
	var done:Bool = false;
	function trigger(){
		var max:MaxxCream = room.get(MaxxCream);

		if (MaxxCream.cutDone == false){
			return;
		}

		if(Player.clothed == true){
			if (clothesLine == false){max.say("I'm not a over the jeans sort of gal");}
			clothesLine = true;
			return;
		}
		if (done == true){
			return;
		}


		var player:Player = room.get(Player);
		player.canControl = false;
		Global.cutscene = true;
		done = true;

		var scene:SexScene = room.get(SexScene);
		scene.visible = true;
		scene.animation.play("getIn");
			scene.afterAnimation (function(){
				trace("sex");
				scene.animation.play("sex");

				var sexTalk = [
					{time:0.0,run:function(){
						max.say("So you want to know about Lena?", null, 3);
						Player.maxxSex = true;
						if (Player.condomOn == false){
							Player.std = true;
							trace(Player.std);
						}
					}},
					{time:3.0,run:function(){
						player.say("Uhhh... Yeah...", null, 3);
					}},
					{time:6.0,run:function(){
						max.say("Well, first I need to ask you, do you know who Lucas Lena is?", null, 3);
					}},
					{time:9.0,run:function(){
						player.say("Mppph... he... he was some famous space adventurer wh...", null, 3);
					}},
					{time:12.0,run:function(){
						player.say("WHAT ARE YOU DOING WITH YOUR FINGER", null, 3);
					}},
					{time:15.0,run:function(){
						max.say("Yes, he was an space adventure much like yourself.", null, 5);
					}},
					{time:20.0,run:function(){
						max.say("Who also fell into debt with Luthberge.", null, 5);
					}},
					{time:25.0,run:function(){
						max.say("*POP*", null, 2);
					}},
					{time:27.0,run:function(){
						player.say("I didnt say stop!", null, 3);
					}},		
					{time:30.0,run:function(){
						max.say("He ended up doing Luthberge's dirty work.", null, 4);
					}},		
					{time:34.0,run:function(){
						max.say("He... he found out something, something big.", null, 4);
					}},	
					{time:38.0,run:function(){
						player.say("Thats not the only thing... fu...", null, 4);
					}},		
					{time:42.0,run:function(){
						max.say("I can give you his location, but not for Luthberge.", null, 4);
					}},	
					{time:46.0,run:function(){
						max.say("I need you to give him this floopy disk, I cant leave.",null,5);
					}},	
					{time:51.0,run:function(){
						player.say("Whyyy... Who... Huh... Wow...",null,5);
					}},	

					{time:57.0,run:function(){
						max.say("Find Lena, lives depend on it.", null, 5);
					}},	
					{time:62.0,run:function(){
						max.say("Can you do that for me?",null, 5);
					}},	
					{time:67.0,run:function(){
						player.say("Yea... yeah... fu... yeah I can do it.", null, 4);
					}},	
					{time:71.0,run:function(){
						max.say("Good, get off me.", null, 4);
					}},	
					{time:75.0,run:function(){
						player.say("Oh... don't I ge...", null, 4);
						scene.visible = false;
					}},	
					{time:79.0,run:function(){
						max.say("Max looks directly at the camera", FlxColor.WHITE, 5);
					}},	
					{time:84.0,run:function(){
						max.say("Thank you for your business.", null, 4);
					}},	
					{time:88.0,run:function(){
						max.say("If you ever need another servicing you know where to go.",null, 4);
						player.canControl = true;
						Global.cutscene = false;
					}},	
				];

				Event.run(sexTalk, false);

			});

	}
}