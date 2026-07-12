package unit;

function main() {
    var x = new Foo(10);
    x.preIncrement();
    assert(x.low == 11);
}

@:forward
private abstract Foo(FooData) {
    public function new(x) {
        this = new FooData(x);
    }

    public function preIncrement() {
        this.low++;
    }
}

private class FooData {
    public var low: haxe.Int32 = 0;
    public function new(low) {
        this.low = low;
    }
}