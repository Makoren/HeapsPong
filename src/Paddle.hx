import hxd.Window;
import h2d.Tile;
import h2d.Object;
import h2d.Bitmap;

class Paddle extends Bitmap {
    var isPlayer: Bool = false;

    public function new(?parent: Object, isPlayer: Bool = false) {
        super(Tile.fromColor(0xFFFFFF, 16, 128), parent);
        tile.dx = -tile.width / 2;
        tile.dy = -tile.height / 2;
        this.isPlayer = isPlayer;
    }

    public function update(dt: Float) {
        if (isPlayer) y = Window.getInstance().mouseY;
    }
}