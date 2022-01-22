import scenes.*;

// Files are embedded in the JS output. You only need the index.html and pong.js files to run the game.

class Main extends hxd.App {
    public var currentScene: Scene;

    override function init() {
        hxd.Res.initEmbed();

        currentScene = new MenuScene(this);
        currentScene.setScene(currentScene);
    }

    override function update(dt: Float) {
        super.update(dt);
        currentScene.update(dt);
    }

    static function main() {
        new Main();
    }
}