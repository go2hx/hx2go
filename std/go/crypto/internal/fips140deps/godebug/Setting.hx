package go.crypto.internal.fips140deps.godebug;

@:structInit
@:go.Type({ name: "Setting", instanceName: "godebug.Setting", imports: ["crypto/internal/fips140deps/godebug"] })
extern class Setting {

    @:native("Value") function value(): String;

}