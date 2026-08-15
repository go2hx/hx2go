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
}

typedef Func = Void -> Void;

function foo() {}
function foo2() {}