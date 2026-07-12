package unit;

function main() {
    var bar: Bar = new Bar();
    var foo: Foo = bar;
    var dyn: Dynamic = bar;

    var f1: Class<Dynamic> = cast bar;
    var f2: Class<Dynamic> = cast foo;
    var f3: Class<Dynamic> = cast dyn;

    assert(f1 != null);
    assert(f2 != null);
    assert(f3 != null);
}

class Foo {
    public function new() {}
}

class Bar extends Foo {}