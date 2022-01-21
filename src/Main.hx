using SceneExtender;

class Main extends hxd.App {
    override function init() {
        hxd.Res.initEmbed();

        var scene = new GameScene();
        setScene(scene);
    }

    override function update(dt: Float) {
        super.update(dt);
    }

    static function main() {
        new Main();
    }
}