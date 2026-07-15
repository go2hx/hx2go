package go.crypto;

@:go.Type({ name: "elliptic", instanceName: "elliptic.elliptic", imports: ["crypto/elliptic"] })
extern class Elliptic {

    @:go.Tuple("priv", "x", "y", "err") @:native("GenerateKey") static function generateKey(curve: go.crypto.elliptic.Curve, rand: go.io.Reader): go.Tuple<{ priv: go.Slice<go.Byte>, x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>, err: go.Error }>;
    @:native("Marshal") static function marshal(curve: go.crypto.elliptic.Curve, x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): go.Slice<go.Byte>;
    @:native("MarshalCompressed") static function marshalCompressed(curve: go.crypto.elliptic.Curve, x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): go.Slice<go.Byte>;
    @:native("P224") static function P224(): go.crypto.elliptic.Curve;
    @:native("P256") static function P256(): go.crypto.elliptic.Curve;
    @:native("P384") static function P384(): go.crypto.elliptic.Curve;
    @:native("P521") static function P521(): go.crypto.elliptic.Curve;
    @:go.Tuple("x", "y") @:native("Unmarshal") static function unmarshal(curve: go.crypto.elliptic.Curve, data: go.Slice<go.Byte>): go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>;
    @:go.Tuple("x", "y") @:native("UnmarshalCompressed") static function unmarshalCompressed(curve: go.crypto.elliptic.Curve, data: go.Slice<go.Byte>): go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>;

}