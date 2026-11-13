package unit;

function main() {
	function foo<T>(expected:Array<T>, a:T) {
		assert(expected[0] == a);
	}
	foo([2], 2);

	function bar<A>(expected:NewArray<A>, a:A) {
		function baz<B>(expected:NewArray<B>, b:B) {
			assert(expected[0] == b);
		}
		baz(expected, a);
	}
	bar([42], 42);

	function ble<B>(expected:Foo<B>, b:B) {
		function blez<B>(expected:Foo<B>, b:B) {
			assert(expected.value == b);
		}
		blez(expected, b);
	}
	ble(new Foo(2), 2);


	function cov<C>(expected:Map<C, C>, c:C) {
		assert(expected[c] == c);
	}
	cov([3 => 3], 3);
}

private class Foo<T> {
	public var value:T;
	public function new(value) {
		this.value = value;
	}
}

typedef NewArray<T> = Array<T>;