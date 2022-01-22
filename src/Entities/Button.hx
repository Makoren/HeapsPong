package entities;

import hxd.Event;
import h2d.Interactive;
import h2d.Tile;
import h2d.Object;
import h2d.Bitmap;

class Button extends Bitmap {
    var interactive: Interactive;

    public function new(?parent: Object, onClick: (event: Event) -> Void) {
        super(hxd.Res.playButton.toTile(), parent);
        tile.dx = -tile.width / 2;
        tile.dy = -tile.height / 2;

        interactive = new Interactive(tile.width, tile.height, this);
        interactive.setPosition(-tile.width / 2, -tile.height / 2);
        interactive.onRelease = onClick;

        scale(2);
    }
}