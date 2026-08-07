function main() {
    trace(foo(10));
}

function foo(x:Null<Int>):Foo {
    return {x: x};
}

@:structInit
class Foo extends Base {
    public function new(?x) {
        super(x);
    }
}

class Base {
    public var x:Int = 0;
    public function new(x) {
        this.x = x;
    }
}