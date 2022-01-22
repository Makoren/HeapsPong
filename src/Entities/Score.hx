package entities;

import hxd.Window;
import h2d.Object;
import scenes.*;

class Score extends h2d.Text {
    // adding a setter here removes the need for the methods below, updating text can be done in the setter
    var playerScore = 0;
    var opponentScore = 0;

    public static var inst: Score = null;
    override function onRemove() {
        super.onRemove();
        inst = null;
    }

    // prop drilling 🤢
    // need some sort of pattern to avoid this unecessary passing of both the scene and the app
    var scene: Scene;
    var app: Main;

    public function new(?parent: Object, scene: Scene, app: Main) {
        if (inst == null) {
            inst = this;
        } else {
            remove();
        }

        this.scene = scene;
        this.app = app;

        super(hxd.Res.pongFont.toFont(), parent);
        textAlign = Center;
        scale(6);
        updateText();
    }

    function updateText() {
        text = '$playerScore   |   $opponentScore';
    }

    public function incrementPlayerScore() {
        playerScore += 1;
        updateText();

        if (playerScore >= 5) {
            var gameScene = cast(scene, GameScene);
            gameScene.gameOverText = new GameOverText("You Win!", getScene(), scene, app);
            gameScene.gameOverText.setPosition(Window.getInstance().width / 2, Window.getInstance().height - 200);
        }
    }

    public function incrementOpponentScore() {
        opponentScore += 1;
        updateText();

        if (opponentScore >= 5) {
            var gameScene = cast(scene, GameScene);
            gameScene.gameOverText = new GameOverText("You Lose...", getScene(), scene, app);
            gameScene.gameOverText.setPosition(Window.getInstance().width / 2, Window.getInstance().height - 200);
        }
    }
}