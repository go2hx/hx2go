interface Foo<K, V> {
    public function add(a: K, b: V): Dynamic;
}

class Bar<T> implements Foo<String, T> {
    public function new() {}
    public function add(a: String, b: T) {
        return (a: Dynamic) + (b: Dynamic);
    }
}

function main() {
    var v = new Bar<Int>();
    trace(v.add("hello", 10));
}