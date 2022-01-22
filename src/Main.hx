class Main extends hxd.App {
    public var currentScene: Scene;

    override function init() {
        hxd.Res.initEmbed();

        currentScene = new GameScene(this);
        currentScene.setScene(currentScene);

        // testing
        // var g = new h2d.Graphics(s2d);
        // g.lineStyle(2, 0xFF0000);
        // var centerX = hxd.Window.getInstance().width / 2;
        // var centerY = hxd.Window.getInstance().height / 2;
        
        // for (i in 0...1000) {
        //     var dir = new h3d.Vector(Random.float(-1, 1), Random.float(-1, 1)).normalized();
        //     g.moveTo(centerX, centerY);
        //     g.lineTo((dir.x * 200) + centerX, (dir.y * 200) + centerY);
        // }
    }

    override function update(dt: Float) {
        super.update(dt);
        currentScene.update(dt);
    }

    static function main() {
        new Main();
    }
}