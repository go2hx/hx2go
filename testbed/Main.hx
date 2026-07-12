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
    trace((10 : haxe.Int64));
}