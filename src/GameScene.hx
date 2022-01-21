import hxd.Window;
import h3d.Vector;
import hxd.Key;

class GameScene extends Scene {
    var ball:Ball;
    var player: Paddle;
    var opponent: Paddle;
    var score: Score;

    public override function new(app: hxd.App) {
        super(app);
        ball = new Ball(scene);

        player = new Paddle(scene, true);
        player.setPosition(100, Window.getInstance().height / 2);

        opponent = new Paddle(scene);
        opponent.setPosition(Window.getInstance().width - 100, Window.getInstance().height / 2);

        score = new Score(scene);
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
            ball.velocity = dir.multiply(ball.speed);
        }

        if (ball.getBounds().intersects(opponent.getBounds())) {
            var ballPos = new Vector(ball.x, ball.y);
            var paddlePos = new Vector(opponent.x, opponent.y);
            var dir = ballPos.sub(paddlePos).normalized();
            ball.velocity = dir.multiply(ball.speed);
        }

        // bounce off top and bottom
        if (ball.getBounds().y < 0 || ball.getBounds().y + ball.getBounds().height > Window.getInstance().height) {
            ball.velocity.y *= -1;
        }

        ball.update(dt);
        player.update(dt);
        opponent.update(dt);

        // testing
        if (Key.isPressed(Key.ESCAPE)) {
            var newScene = new MenuScene(app);
            app.setScene(newScene.scene);
        }
    }
}