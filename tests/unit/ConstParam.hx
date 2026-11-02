package unit;

@:generic class X<@:const T, @:const S> {
	public function new() { }

	public function getString() {
		return T + " " + S;
	}
}

function main() {
	var c = new X<'foo', 12>();
	assert(c.getString() == "foo 12");
}