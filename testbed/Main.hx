interface GetX {
    public function getX(): Float;
}

interface GetY {
    public function getY(): Float;
}

class Point implements GetX implements GetY {

    public var x: Float = 0;
    public var y: Float = 0;

    public function new(x: Float, y: Float) {
        this.x = x;
        this.y = y;
    }

    public function getX(): Float {
        return x;
    }

    public function getY(): Float {
        return y;
    }

}

function main() {
    var p: Point = new Point(10, 20);
    var px: GetX = p;
    var py: GetY = p;
    var v = cast (px, GetY);

    trace(p, px.getX(), py.getY(), v.getY());
}