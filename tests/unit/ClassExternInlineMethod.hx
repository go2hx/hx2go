package unit;

function main() {
   assert(new Foo() != null);
}


private class Foo {
   public function new() {}
   extern inline function bar() {
		return 0;
	}
}