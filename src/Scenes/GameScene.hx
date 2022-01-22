package scenes;

import h2d.Particles;
import hxd.Window;
import h3d.Vector;
import hxd.Key;
import entities.*;

class GameScene extends Scene {
    var ball:Ball;
    var player: Paddle;
    var opponent: Paddle;
    var score: Score;

    var paddleSounds = [
        hxd.Res.impactMining_000,
        hxd.Res.impactMining_001,
        hxd.Res.impactMining_002,
        hxd.Res.impactMining_003,
        hxd.Res.impactMining_004
    ];
    var paddleSoundLastPlay: Float = 0;
    
    // this sort of thing can be prevented with an array of entities on the scene
    public var gameOverText: Null<GameOverText> = null;

    public override function new(app: Main) {
        super(app);
        ball = new Ball(scene);

        player = new Paddle(scene, true);
        player.setPosition(100, Window.getInstance().height / 2);

        opponent = new Paddle(scene);
        opponent.setPosition(Window.getInstance().width - 100, Window.getInstance().height / 2);

        score = new Score(scene, this, app);
        score.setPosition(Window.getInstance().width / 2, 40);
    }

    public override function update(dt: Float) {
        // check if any input is pressed, this might need to be a helper function of some sort
        for (i in 0...1024) {
            if (Key.isPressed(i)) {
                ball.shoot();
            }
        }

        // collision between paddles and balls (this is where it will be handy to have an array of entities to loop over)
        if (ball.getBounds().intersects(player.getBounds())) {
            // this calculation should be done on the ball
            // sub means subtract here btw
            var ballPos = new Vector(ball.x, ball.y);
            var paddlePos = new Vector(player.x, player.y);
            var dir = ballPos.sub(paddlePos).normalized();
            ball.direction = dir;
            createParticles();
            paddleSound();
        }

        if (ball.getBounds().intersects(opponent.getBounds())) {
            var ballPos = new Vector(ball.x, ball.y);
            var paddlePos = new Vector(opponent.x, opponent.y);
            var dir = ballPos.sub(paddlePos).normalized();
            ball.direction = dir;
            createParticles();
            paddleSound();
        }

        // bounce off top and bottom
        if (ball.getBounds().y < 0) {
            ball.direction.y = Math.abs(ball.direction.y);
        }

        if (ball.getBounds().y + ball.getBounds().height > Window.getInstance().height) {
            ball.direction.y = -Math.abs(ball.direction.y);
        }

        ball.update(dt);
        player.update(dt);
        opponent.update(dt);
        if (gameOverText != null) gameOverText.update(dt);

        // testing
        if (Key.isPressed(Key.ESCAPE)) {
            setScene(new MenuScene(app));
        }
    }

    function createParticles() {
        var particleSystem = new Particles(scene);
        var pGroup = new ParticleGroup(particleSystem);
        pGroup.emitLoop = false;
        pGroup.life = 0.2;
        pGroup.fadeIn = 0;
        pGroup.fadeOut = 1;
        pGroup.fadePower = 5;
        pGroup.size = 0.2;
        pGroup.nparts = 10;
        pGroup.speed = 100;
        pGroup.gravity = 5;
        particleSystem.setPosition(ball.x, ball.y);
        particleSystem.addGroup(pGroup);
        particleSystem.onEnd = function() {
            particleSystem.removeGroup(pGroup);
        }
    }

    function paddleSound() {
        if (haxe.Timer.stamp() - paddleSoundLastPlay < 0.1) return;
        paddleSoundLastPlay = haxe.Timer.stamp();
        Random.fromArray(paddleSounds).play();
    }
}