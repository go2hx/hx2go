package go.crypto.internal;

@:go.Type({ name: "impl", instanceName: "impl.impl", imports: ["crypto/internal/impl"] })
extern class Impl {

    @:native("List") static function list(pkg: String): go.Slice<String>;
    @:native("Packages") static function packages(): go.Slice<String>;
    @:native("Register") static function register(pkg: String, name: String, available: go.Pointer<Bool>): Void;
    @:native("Reset") static function reset(pkg: String): Void;
    @:native("Select") static function select(pkg: String, name: String): Bool;

}