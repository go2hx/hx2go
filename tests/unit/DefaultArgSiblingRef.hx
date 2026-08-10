package unit;

// Reduced from unit.TestDefaultArgs (haxe/tests/unit).
// A default argument value that references an earlier parameter. hx2go emits
// the default expression in a context where the sibling parameter is not in
// scope, producing Go: "undefined: a".

function main() {
	assert(fSibling(5) == 10);
	assert(fChain() == "1,1,1");
	assert(fChain(2) == "2,2,2");
}

function fSibling(a:Int, b:Int = a):Int
	return a + b;

function fChain(a:Int = 1, b:Int = a, c:Int = b):String
	return '$a,$b,$c';
