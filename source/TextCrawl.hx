package;

import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxColor;

class TextCrawl extends FlxText {

    public function new() {
            super(0,0,FlxG.width*0.75,
'
It has been two years since Rodger Packwood\'s defeat of the infamous space-pirate Captain Schmuggler.

Rodger blasted onto the galactic world stage, but has since fallen into obscurity, known only by pub quiz masters who describe him as '
+' \'that person who did that thing one time\' on trivia nights.

Rodger lost both his money and celebrity status on a cryptocurrency scheme which went south. 

Dejected, he turned to loaning large sums of money from the vile gangster Leonard Luthberge.

Little does Rodger know that his debts are catching up to him...
'
);
        size = 60;
        color = FlxColor.YELLOW;
        alignment = CENTER;
        FlxG.state.add(this);
        //FlxG.state.add(text);
        x = FlxG.width/2-width/2;
        y = FlxG.height*1.55;

    }

    override public function update(d) {
       super.update(d);

       y-=75*d;

       if(y < -height) {
          var s = cast(FlxG.state,OpeningScene).s;
          s.volume -= d/2;
          if(s.volume <= 0)
            FlxG.switchState(new adventure.Game());
       }

    } 

}
