class Scene {
    var scene = new h2d.Scene();
    public var app: Main;

    public function new(app: Main) {
        this.app = app;
    }

    public function update(dt: Float) {}

    public function setScene(newScene: Scene) {
        app.currentScene = newScene;
        app.setScene(newScene.scene);
    }
}