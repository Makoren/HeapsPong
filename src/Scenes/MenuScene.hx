package scenes;

import hxd.Event;
import hxd.Window;

import entities.*;

class MenuScene extends Scene {
    var playButton: Button;

    override public function new(app: Main) {
        super(app);

        var title = new h2d.Text(hxd.Res.pongFont.toFont(), scene);
        title.text = "Pong";
        title.setPosition(Window.getInstance().width / 2, 80);
        title.scale(6);
        title.textAlign = Center;

        var title = new h2d.Text(hxd.Res.pongFont.toFont(), scene);
        title.text = "First to 5 wins!";
        title.setPosition(Window.getInstance().width / 2, 180);
        title.scale(2);
        title.textAlign = Center;

        playButton = new Button(scene, function(event: Event) {
            setScene(new GameScene(app));
        });
        playButton.setPosition(Window.getInstance().width / 2, Window.getInstance().height - 100);
    }

    override function update(dt:Float) {
        
    }
}