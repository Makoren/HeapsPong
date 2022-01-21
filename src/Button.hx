import hxd.Event;
import h2d.Interactive;
import h2d.Tile;
import h2d.Object;
import h2d.Bitmap;

class Button extends Bitmap {
    var interactive: Interactive;

    public function new(?parent: Object, onClick: (event: Event) -> Void) {
        super(Tile.fromColor(0xFFFFFF, 200, 100), parent);
        tile.dx = -tile.width / 2;
        tile.dy = -tile.height / 2;

        interactive = new Interactive(tile.width, tile.height, this);
        interactive.setPosition(-100, -50);
        interactive.onRelease = onClick;
    }
}