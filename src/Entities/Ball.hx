package entities;

import hxd.Window;
import h3d.Vector;
import h2d.Tile;
import h2d.Object;
import h2d.Bitmap;

class Ball extends Bitmap {
    // these should be getters
    public var direction = new Vector();
    public var speed: Float;
    var startSpeed = 5;
    var hasShot = false;

    var speedTimer = 3;
    var currentSpeedTimer: Float;

    // this idea of static instances could be really weird if you forget to clean up
    public static var inst: Ball = null;
    override function onRemove() {
        super.onRemove();
        inst = null;
    }

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

        currentSpeedTimer = speedTimer;
        speed = startSpeed;
    }

    function reset() {
        setPosition(Window.getInstance().width / 2, Window.getInstance().height / 2);
        direction = new Vector();
        hasShot = false;
        speed = startSpeed;
    }

    public function update(dt: Float) {
        setPosition(x + direction.x * speed, y + direction.y * speed);

        if (hasShot) {
            currentSpeedTimer -= dt;
            if (currentSpeedTimer <= 0) {
                speed += 1;
                currentSpeedTimer = speedTimer;
            }
        }

        if (x > Window.getInstance().width) {
            Score.inst.incrementPlayerScore();
            hxd.Res.error_006.play();
            reset();
        } else if (x < 0) {
            Score.inst.incrementOpponentScore();
            hxd.Res.error_006.play();
            reset();
        }
    }

    public function shoot() {
        hasShot ? return : hasShot = true;
        var num = Random.float(-1, 1);
        num > 0 ? direction.x = 1 : direction.x = -1;
    }
}