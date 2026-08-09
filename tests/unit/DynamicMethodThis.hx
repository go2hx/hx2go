package unit;

// Reduced from unit.TestMisc (MyDynamicClass, haxe/tests/unit).
// A `dynamic` instance method that references instance fields. hx2go emits the
// dynamic method body as a free-standing closure that still refers to `this`,
// which is not bound in that context, producing Go:
//   undefined: this

class DynBox {
	var v:Int;

	public function new(v:Int) {
		this.v = v;
	}

	public dynamic function add(x:Int, y:Int):Int {
		return v + x + y;
	}
}

function main() {
	var b = new DynBox(100);
	assert(b.add(1, 2) == 103);

	b.add = function(x, y) return x + y;
	assert(b.add(1, 2) == 3);
}
