import hxd.Window;
import h3d.Vector;
import h2d.Tile;
import h2d.Object;
import h2d.Bitmap;

class Ball extends Bitmap {
    // these should be getters
    public var velocity = new Vector();
    public var speed: Float = 5;
    var hasShot = false;

    public static var inst: Ball = null;

    public function new(?parent: Object) {
        if (inst == null) {
            inst = this;
        } else {
            remove();
        }

        super(Tile.fromColor(0xFFFFFF, 16, 16), parent);
        tile.dx = -tile.width / 2;
        tile.dy = -tile.height / 2;
        reset();
    }

    function reset() {
        setPosition(Window.getInstance().width / 2, Window.getInstance().height / 2);
        velocity = new Vector();
        hasShot = false;
    }

    public function update(dt: Float) {
        setPosition(x + velocity.x, y + velocity.y);

        if (x > Window.getInstance().width) {
            Score.inst.incrementPlayerScore();
            reset();
        } else if (x < 0) {
            Score.inst.incrementOpponentScore();
            reset();
        }
    }

    public function shoot() {
        hasShot ? return : hasShot = true;
        trace("shuut?");
        velocity.x = Random.float(-1, 1);
        velocity.y = Random.float(-1, 1);
        velocity = velocity.normalized().multiply(speed);
    }
}