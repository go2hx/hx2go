interface Foo<K, V> {
    public function add(a: K, b: V): Dynamic;
}

class Bar<T> implements Foo<String, T> {
    public function new() {}
    public function add(a: String, b: T) {
        return a + (b: Dynamic);
    }
}

function main() {
    var v = new Bar<Int>();
    var s = v.add("hello", 10);

    trace(s);
}