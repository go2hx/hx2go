package unit;
function main() {
    var p = new Point(1.3,5);
    var px : IX = p;
    assert(px.foo() == "bar");
}

private class Base {
	public function base() {
		return "base";
	}
}

private class Point implements IX extends Base {

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

private interface IX extends Foo {
	public function getX() : Float;
}

private interface Foo {
	public function foo() : String;
}
