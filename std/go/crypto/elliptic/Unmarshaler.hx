package go.crypto.elliptic;

@:go.Type({ name: "unmarshaler", instanceName: "elliptic.unmarshaler", imports: ["crypto/elliptic"] })
extern typedef Unmarshaler = {

    @:go.Tuple("x", "y") @:native("Unmarshal") function unmarshal(p0: go.Slice<go.Byte>): (go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>);
    @:go.Tuple("x", "y") @:native("UnmarshalCompressed") function unmarshalCompressed(p0: go.Slice<go.Byte>): (go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>);

}