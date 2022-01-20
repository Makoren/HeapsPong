import hxd.Window;

class Main extends hxd.App {
    var ball:Ball;
    var player: Paddle;
    var opponent: Paddle;

    override function init() {
        ball = new Ball(s2d);
        ball.setPosition(Window.getInstance().width / 2, Window.getInstance().height / 2);

        player = new Paddle(s2d);
        player.setPosition(100, Window.getInstance().height / 2);

        opponent = new Paddle(s2d);
        opponent.setPosition(Window.getInstance().width - 100, Window.getInstance().height / 2);
    }

    static function main() {
        new Main();
    }
}