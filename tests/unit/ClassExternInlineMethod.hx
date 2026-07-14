package unit;

function main() {
   assert(new Foo() != null);
}


class Foo {
   public function new() {}
   extern inline function bar() {
		return 0;
	}
}