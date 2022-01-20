import h2d.Tile;
import h2d.Object;
import h2d.Bitmap;

class Paddle extends Bitmap {
    public function new(?parent: Object) {
        super(Tile.fromColor(0xFFFFFF, 16, 128), parent);
        tile.dx = -tile.width / 2;
        tile.dy = -tile.height / 2;
    }

    public function update(dt: Float) {
        
    }
}