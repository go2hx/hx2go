package go.crypto.internal.fips140deps;

@:go.Type({ name: "godebug", instanceName: "godebug.godebug", imports: ["crypto/internal/fips140deps/godebug"] })
extern class Godebug {

    @:native("New") static function _new(name: String): go.Pointer<go.crypto.internal.fips140deps.godebug.Setting>;
    @:native("Value") static function value(name: String): String;

}