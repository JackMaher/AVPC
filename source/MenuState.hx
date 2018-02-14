package;

import flixel.FlxState;
import flixel.FlxG;

class MenuState extends FlxState {

    override public function create() {
        super.create();

        var menu = new adventure.Menu();
        menu.makeOption(0,0,2,1,"BEGIN GAME", function() {
            FlxG.switchState(new OpeningScene());
        });

        menu.alpha = 1;
        menu.show();
        add(menu);

    }

    override public function update(d) {
        super.update(d);
        FlxG.mouse.visible = true;
    }
}
