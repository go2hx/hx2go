import go.hx2go.HxDynamic;
class Test {

    public function new() {}

    public function foo() {
        trace("Foo");
    }

    public function bar() {
        trace("Bar");
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
}