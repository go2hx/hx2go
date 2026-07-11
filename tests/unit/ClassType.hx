package unit;

function main() {
    var f:Class<Foo> = cast new Foo();
    assert(f != null);
}

class Foo {
    public function new() {}
}