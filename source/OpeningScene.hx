package;

import flixel.FlxState;
import flixel.FlxG;

import flixel.effects.filters.*;
import flixel.effects.postprocess.*;
import flixel.addons.display.FlxStarField;
import flash.filters.*;

class OpeningScene extends FlxState {

    var waterShader:Water;

    override public function create() {
        super.create();

        add(new FlxStarField2D(0,0,FlxG.width,FlxG.height));
        new TextCrawl();

        waterShader = new Water();
        FlxG.camera.setFilters([new ShaderFilter(waterShader)]);

    }

    override public function update(d) {
        super.update(d);
    }

}
