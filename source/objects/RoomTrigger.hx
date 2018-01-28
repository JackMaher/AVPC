package objects;

import adventure.*;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;

class RoomTrigger extends Trigger {
    var newRoom:Class<Room>;
    var newX:Int;

    var newY:Int;


    function new (x,nRoom,nX,nY){
        super (x);
        newRoom = nRoom;
        visible = false;
        newX = nX;
        newY = nY;

    }
    function trigger(){
        var oldVel   = room.get(Player).velocity.x;
        room.get(Player).velocity.x = 0;
        var oldFlipX = room.get(Player).flipX;
       // trace(oldVel);

        game.switchRoom(newRoom, newX, newY);
        var newPlayer = Global.currentRoom.get(Player);
        newPlayer.velocity.x = oldVel;
        newPlayer.flipX      = oldFlipX;
    }
}