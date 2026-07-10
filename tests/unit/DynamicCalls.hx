package unit;


private class TestClass {
    public function new() {}

    public function foo(): String {
        return "Foo";
    }

    public function bar(): String {
        return "Bar";
    }

    public static function mul(a: Int, b: Int): Float {
        return a * b;
    }
}

private typedef Sub = {
    public function foo(): String;
}

function main() {
    var v = new TestClass();
    assert(v.foo() == "Foo");
    assert(v.bar() == "Bar");

    var s: Sub = v;
    assert(s.foo() == "Foo");

    var d: Dynamic = v;
    assert(d.foo() == "Foo");
    assert(d.bar() == "Bar");

    var hello: Void->String = () -> {
        return "Hello";
    }

    assert(hello() == "Hello");

    var hello_dyn: Dynamic = hello;
    assert(hello_dyn() == "Hello");

    assert(TestClass.mul(10, 15) == 150.0);

    var mul_dyn: Dynamic = TestClass.mul;
    assert(mul_dyn(10, 15) == 150.0);
}
