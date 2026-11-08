package unit;

private interface IY {
    function getY(): Float;
}

private class Point implements IY {
    public function new() {}
    public function getY(): Int {
        return 10;
    }
}

function main() {
    var p = new Point();
    var iy:IY = p;
    assert(p.getY() == 10);
    assert(iy.getY() == 10.0);
}
