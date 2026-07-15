package go;

@:go.Type({ name: "unique", instanceName: "unique.unique", imports: ["unique"] })
extern class Unique {

    @:native("Make") static function make<T: go.Comparable>(value: T): go.unique.Handle<T>;

}