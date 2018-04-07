package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;


import flixel.effects.filters.*;
import flixel.effects.postprocess.*;
import flixel.addons.display.FlxStarField;
import openfl.display.Shader;
import flash.filters.*;
import flixel.util.FlxColor;
import flixel.system.FlxSound;

class OpeningScene extends FlxState {

    var waterShader:Taper;
    var t1:FlxText;
    var t2:FlxText;
    var t:Float = 4.3;
    var shaderTime:Float = 0;
    public var s:FlxSound;

    override public function create() {
        super.create();

        //add(new FlxStarField2D(0,0,FlxG.width,FlxG.height));

        add(t1=new FlxText(0,FlxG.height/2-120,FlxG.width,"RODGER PACKWOOD"));
        t1.setFormat(null,160,FlxColor.YELLOW,CENTER);
        t1.visible = false;
        add(t2=new FlxText(0,FlxG.height/2+80,FlxG.width,"and the Case of the Reusable Prophylactic"));
        t2.setFormat(null,70,FlxColor.YELLOW,CENTER);
        t2.visible = false;

        var a = new TextCrawl();

        s = FlxG.sound.play("assets/music/sw.ogg");

        waterShader = new Taper();

        var param:GLShaderParameter = new GLShaderParameter("vec2",2);
        param.value = [FlxG.stage.stageWidth,FlxG.stage.stageHeight];
        waterShader.data["iResolution"] = param;

        FlxG.camera.setFilters([new ShaderFilter(waterShader)]);
        //a.shader = waterShader;
        //FlxG.scaleMode = new flixel.system.scaleModes.FillScaleMode();

        onResize(FlxG.stage.stageWidth,FlxG.stage.stageHeight);

    }

    override public function update(d) {
        super.update(d);

        shaderTime += d;
        var param:GLShaderParameter = new GLShaderParameter("float",1);
        param.value = [ shaderTime ];
        waterShader.data["time"] = param;

        t -= d/2;
        if(t <= 3.86) {
            t1.visible = true;
            t2.visible = true;
        }
        t1.alpha = t;
        t2.alpha = t;
    }

    override public function onResize(w,h) {
        var w = Std.int(w);
        var h = Std.int(h);
        var param:GLShaderParameter = new GLShaderParameter("vec2",2);
        param.value = [w,h];
        waterShader.data["iResolution"] = param;

        var param:GLShaderParameter = new GLShaderParameter("vec2",2);
        var w2 = nextPower(w);
        var h2 = nextPower(h);
        param.value = [w2,h2];
        waterShader.data["native"] = param;
    }

    inline function nextPower(k:Int) {
        var n=1;
        while(n < k)
            n*=2;
        return Std.int(n);
    }

}
