function main() {
    var p = new Point(1.3,5);
    var px : IX = p;
    trace( px == p );
    trace( p == px );

    var dyn_px: Dynamic = px;
    var dyn_p: Dynamic = p;
    trace( dyn_px == dyn_p );
    trace( dyn_p == dyn_px );
}

private class Point implements IX {

    var x : Float;

    public function new(x,y) {
        this.x = x;
    }

    public function getX() {
        return x;
    }

    public function foo() {
        return "bar";
    }

}

private interface IX {
    public function getX() : Float;
}
