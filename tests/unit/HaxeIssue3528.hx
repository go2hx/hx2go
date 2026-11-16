package unit;

import haxe.ds.Option;

private abstract Optional<T>(haxe.ds.Option<T>) from haxe.ds.Option<T> to haxe.ds.Option<T> {}

private class Box {
	public var n:Int;
	public function new(n:Int) this.n = n;
}

function main() {
	var x:Optional<Box> = Some(new Box(42));
	var got = -1;
	switch x {
		case Some(v): got = v.n;
		case None:
	}
	assert(got == 42);
}
