package scenes;

import hxd.Event;
import hxd.Window;

import entities.*;

class MenuScene extends Scene {
    var playButton: Button;

    override public function new(app: Main) {
        super(app);
        playButton = new Button(scene, function(event: Event) {
            setScene(new GameScene(app));
        });
        playButton.setPosition(Window.getInstance().width / 2, Window.getInstance().height / 2);
    }

    override function update(dt:Float) {
        
    }
}