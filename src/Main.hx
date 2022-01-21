class Main extends hxd.App {
    public var currentScene: Scene;

    override function init() {
        hxd.Res.initEmbed();

        currentScene = new GameScene(this);
        setScene(currentScene.scene);
    }

    override function update(dt: Float) {
        super.update(dt);
        currentScene.update(dt);
    }

    static function main() {
        new Main();
    }
}