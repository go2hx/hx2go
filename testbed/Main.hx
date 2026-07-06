import go.hx2go.HxDynamic;
class Test {

    public function new() {}

    public function foo() {
        trace("Foo");
    }

    public function bar() {
        trace("Bar");
    }

    public static function mul(a: Int, b: Int): Float {
        return a * b;
    }

}

typedef Sub = {
    public function foo(): Void;
}

function main() {
    var v: Test = new Test();
    v.foo();
    v.bar();

    var s: Sub = v;
    s.foo();

    var d: Dynamic = v;
    d.foo();
    d.bar();

    var hello: Void->Void = () -> {
        trace("Hello");
    }

    hello();

    var hello_dyn: Dynamic = hello;
    hello_dyn();

    trace(Test.mul(10, 15));

    var mul_dyn: Dynamic = Test.mul;
    trace(mul_dyn(10, 15));
}