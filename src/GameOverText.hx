import h2d.Object;

class GameOverText extends h2d.Text {
    var timer: Float = 2;

    // need some sort of pattern to avoid this unecessary passing of both the scene and the app
    var scene: Scene;
    var app: Main;

    public function new(message: String, ?parent: Object, scene: Scene, app: Main) {
        super(hxd.Res.pongFont.toFont(), parent);
        text = message;
        this.scene = scene;
        this.app = app;

        textAlign = Center;
        scale(6);
    }

    public function update(dt: Float) {
        timer -= dt;
        if (timer <= 0) {
            scene.setScene(new MenuScene(app));
        }
    }
}