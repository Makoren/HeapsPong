import hxd.Key;
import hxd.Window;

class Main extends hxd.App {
    var ball:Ball;
    var player: Paddle;
    var opponent: Paddle;

    override function init() {
        ball = new Ball(s2d);
        ball.setPosition(Window.getInstance().width / 2, Window.getInstance().height / 2);

        player = new Paddle(s2d, true);
        player.setPosition(200, Window.getInstance().height / 2);

        opponent = new Paddle(s2d);
        opponent.setPosition(Window.getInstance().width - 200, Window.getInstance().height / 2);
    }

    override function update(dt: Float) {
        super.update(dt);

        // check if any input is pressed, this might need to be a helper function of some sort
        for (i in 0...1024) {
            if (Key.isPressed(i)) {
                ball.shoot();
            }
        }

        if (ball.getBounds().intersects(player.getBounds()) || ball.getBounds().intersects(opponent.getBounds())) {
            ball.velocity.x *= -1;
        }

        ball.update(dt);
        player.update(dt);
        opponent.update(dt);
    }

    static function main() {
        new Main();
    }
}