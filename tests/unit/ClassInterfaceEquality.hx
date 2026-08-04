package unit;
function main() {
    var p = new Point(1.3,5);
    var px : IX = p;
    assert( px == p );
    assert( p == px );
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
