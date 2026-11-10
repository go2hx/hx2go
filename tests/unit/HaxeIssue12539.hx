package unit;


private typedef Recursive<F> = Recursive<F>->F;
private typedef YDef<P, R> = Recursive<P->R>;

function unit<P, R>():YDef<P, R> {
	return function(fn:Recursive<P->R>):P->R return fn(fn);
}

function main() {
	var y = unit();
	assert(y != null);
}
