class Foo<K, V> {
    public function new() {}
    public function add(a: K, b: V) {
        return (a: Dynamic) + (b: Dynamic);
    }
}

class Bar<T> extends Foo<String, T> {
    override public function add(a: String, b: T) {
        return (a: Dynamic) + (b: Dynamic);
    }
}

function main() {
    var f = new Foo<Int, Int>();
    var b = new Bar<Int>();

    trace(f.add(10, 20));
    trace(b.add("Hello", 50));
}