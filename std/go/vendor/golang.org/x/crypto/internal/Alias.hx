package go.vendor.golang.org.x.crypto.internal;

@:go.Type({ name: "alias", instanceName: "alias.alias", imports: ["vendor/golang.org/x/crypto/internal/alias"] })
extern class Alias {

    @:native("AnyOverlap") static function anyOverlap(x: go.Slice<go.Byte>, y: go.Slice<go.Byte>): Bool;
    @:native("InexactOverlap") static function inexactOverlap(x: go.Slice<go.Byte>, y: go.Slice<go.Byte>): Bool;

}