package unit;
function main() {
	assert((foo : Dynamic) == (foo : Dynamic));
	assert(foo == foo);
	assert((foo : Dynamic) == foo);
	assert((foo : Dynamic) != (foo2 : Dynamic));
	assert(foo != foo2);
	assert((foo : Func) != (foo2 : Func));
	assert((foo : Null<Func>) != (foo2 : Func));
	assert((foo : Null<Func>) == (foo : Func));
	var cl1 = new Cl();
	var cl2 = new Cl();
	trace(cl1.method == cl1.method);
	trace(cl1.method != cl2.method);
}

typedef Func = Void -> Void;

function foo() {}
function foo2() {}

class Cl {
	public function new() {}
	public function method() {}
}