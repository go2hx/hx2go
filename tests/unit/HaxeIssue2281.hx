package unit;

function main() {
	var fint = new Foo();
	fint.val = 0;
	assert(0 == fint.val++);
	assert(1 == fint.val);
	assert(2 == ++fint.val);
	eq(12, fint.val += 10);
	fint.valNull = 0;
	assert(0 == fint.valNull++);
	assert(1 == fint.valNull);
	assert(2 == ++fint.valNull);
	eq(12, fint.valNull += 10);
	fint.val2 = 0;
	assert(0 == fint.val2++);
	assert(1 == fint.val2);
	assert(2 == ++fint.val2);
	eq(12, fint.val2 += 10);
}

function eq(a:Dynamic, b:Dynamic) {
	assert(a == b);
}

private class Foo<T> {
	public var val:T;
	public var valNull:Null<T>;
	public var val2:Null<Int>;

	public function new() {}
}
