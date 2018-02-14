package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;


import flixel.effects.filters.*;
import flixel.effects.postprocess.*;
import flixel.addons.display.FlxStarField;
import flash.filters.*;
import flixel.util.FlxColor;
import flixel.system.FlxSound;

class OpeningScene extends FlxState {

    var waterShader:Taper;
    var t1:FlxText;
    var t2:FlxText;
    var t:Float = 4.3;
    public var s:FlxSound;

    override public function create() {
        super.create();

        add(new FlxStarField2D(0,0,FlxG.width,FlxG.height));

        add(t1=new FlxText(0,FlxG.height/2-120,FlxG.width,"RODGER PACKWOOD"));
        t1.setFormat(null,160,FlxColor.YELLOW,CENTER);
        t1.visible = false;
        add(t2=new FlxText(0,FlxG.height/2+80,FlxG.width,"and the Case of the Reusable Prophylactic"));
        t2.setFormat(null,70,FlxColor.YELLOW,CENTER);
        t2.visible = false;
        
        new TextCrawl();

        s = FlxG.sound.play("assets/music/sw.ogg");

        waterShader = new Taper();
        FlxG.camera.setFilters([new ShaderFilter(waterShader)]);

    }

    override public function update(d) {
        super.update(d);
        t -= d/2;
        if(t <= 3.86) {
            t1.visible = true;
            t2.visible = true;
        }
        t1.alpha = t;
        t2.alpha = t;
    }

}
