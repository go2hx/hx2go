package go.crypto.internal;

@:go.Type({ name: "constanttime", instanceName: "constanttime.constanttime", imports: ["crypto/internal/constanttime"] })
extern class Constanttime {

    @:native("ByteEq") static function byteEq(x: go.UInt8, y: go.UInt8): go.GoInt;
    @:native("Eq") static function eq(x: go.Int32, y: go.Int32): go.GoInt;
    @:native("LessOrEq") static function lessOrEq(x: go.GoInt, y: go.GoInt): go.GoInt;
    @:native("Select") static function select(v: go.GoInt, x: go.GoInt, y: go.GoInt): go.GoInt;

}