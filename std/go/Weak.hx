package go;

@:go.Type({ name: "weak", instanceName: "weak.weak", imports: ["weak"] })
extern class Weak {

    @:native("Make") static function make<T: Dynamic>(ptr: go.Pointer<T>): go.weak.Pointer<T>;

}