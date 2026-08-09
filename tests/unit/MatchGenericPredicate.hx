package unit;

// Reduced from unit.TestMatch (haxe/tests/unit), the `isTrue(even)` extractor.
// A *local* generic function `isTrue<T>(pred:T->Bool)` used as a switch
// extractor is not monomorphized: hx2go types its parameter as `func(any) bool`,
// but the concrete `even` passed in is `func(int32) bool`:
//   cannot use even (value of type func(i int32) bool) as func(any) bool value
//   in argument to isTrue
//
// Note: making isTrue a top-level function instead makes it monomorphize
// correctly and the error disappears — the bug is specific to local generics
// used as extractors.

function main() {
	assert(check(2) == 1);
	assert(check(3) == 3);
}

function check(a:Int):Int {
	function isTrue<T>(pred:T->Bool):T->Bool
		return pred;

	return switch a {
		case isTrue(even)(_) => true: 1;
		case _: 3;
	}
}

function even(i:Int):Bool {
	return i & 1 == 0;
}
