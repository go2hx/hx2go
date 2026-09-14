package unit;

function main() {
	var checker = new Checker();

	var dynArg:Dynamic = ([new Point(10), new Point(20)] : Array<Dynamic>);
	var func:Dynamic = Reflect.field(checker, "check");
	assert(func != null);

	Reflect.callMethod(checker, func, [dynArg]);

	assert(checker.seen != null);
	assert(checker.seen.length == 2);
	assert(checker.seen[0].x == 10);
	assert(checker.seen[1].x == 20);
}

private class Checker {
	public var seen:Array<Point> = null;
	public function new() {}

	public function check(value:Array<Point>):Void {
		seen = value;
	}
}

private class Point {
	public var x:Int;
	public function new(x:Int) this.x = x;
}
