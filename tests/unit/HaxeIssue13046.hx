package unit;

private class Base<T> {
	public function new() {}
	public function call() : T {
		return null;
	}
	public function call2() : T {
		return null;
	}
}

private class Sub extends Base<Void> {
	public var calls = 0;
	override function call() : Void {
		calls++;
		if( calls > 1 )
			return; // mid-body void return against erased `any` signature
		calls++;
	}
	override function call2() : Void {
		// empty body: fall-through, no TReturn at all
	}
}

function main() {
	var sub = new Sub();
	var i : Base<Void> = sub;

	i.call();
	assert(sub.calls == 2);
	i.call();
	assert(sub.calls == 3);
	sub.call();
	assert(sub.calls == 4);

	i.call2();
	sub.call2();
	assert(sub.calls == 4);
}
