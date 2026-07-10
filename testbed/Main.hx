import go.fmt.Fmt;
interface Foo<K, V> {}

class Bar<T> implements Foo<Int, T> {
    public function new(): Void {}
}

@:transitive
abstract Baz<K, V>(Foo<K, V>) {

    @:from public static function fromBar<T>(barInst: Bar<T>): Baz<Int, T> {
        return cast barInst;
    }

}

function main() {
    var x = new Bar<String>();
    var y = Baz.fromBar(x);
}