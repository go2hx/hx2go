package go.crypto.internal.fips140;

@:go.Type({ name: "alias", instanceName: "alias.alias", imports: ["crypto/internal/fips140/alias"] })
extern class Alias {

    @:native("AnyOverlap") static function anyOverlap(x: go.Slice<go.Byte>, y: go.Slice<go.Byte>): Bool;
    @:native("InexactOverlap") static function inexactOverlap(x: go.Slice<go.Byte>, y: go.Slice<go.Byte>): Bool;

}