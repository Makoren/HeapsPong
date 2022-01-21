import h2d.Object;

class Score extends h2d.Text {
    // adding a setter here removes the need for the methods below, updating text can be done in the setter
    var playerScore = 0;
    var opponentScore = 0;

    public static var inst: Score = null;

    public function new(?parent: Object) {
        if (inst == null) {
            inst = this;
        } else {
            remove();
        }

        super(hxd.res.DefaultFont.get(), parent);
        textAlign = Center;
        updateText();
    }

    function updateText() {
        text = '$playerScore | $opponentScore';
    }

    public function incrementPlayerScore() {
        playerScore += 1;
        updateText();
    }

    public function incrementOpponentScore() {
        opponentScore += 1;
        updateText();
    }
}