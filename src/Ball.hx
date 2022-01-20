import h3d.Vector;
import h2d.Tile;
import h2d.Object;
import h2d.Bitmap;

class Ball extends Bitmap {
    var velocity: Vector = new Vector();
    var speed: Float = 3;

    public function new(?parent: Object) {
        super(Tile.fromColor(0xFFFFFF, 16, 16), parent);
        tile.dx = -tile.width / 2;
        tile.dy = -tile.height / 2;
        shoot();
    }

    public function update(dt: Float) {
        setPosition(x + velocity.x, y + velocity.y);
        trace(velocity.x);
        trace(velocity.y);
    }

    function shoot() {
        velocity.x = Random.float(-1, 1);
        velocity.y = Random.float(-1, 1);
        velocity = velocity.normalized().multiply(speed);
    }
}