interface Foo {
    public var v: Int;
}

class Bar implements Foo {

    public var v: Int;

    public function new(_v: Int) {
        v = _v;
    }

}

function main() {
    var x: Bar = new Bar(10);
    var y: Foo = x;

    trace(x.v, y.v);
}