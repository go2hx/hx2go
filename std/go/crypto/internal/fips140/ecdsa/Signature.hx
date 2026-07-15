package go.crypto.internal.fips140.ecdsa;

@:structInit
@:go.Type({ name: "Signature", instanceName: "ecdsa.Signature", imports: ["crypto/internal/fips140/ecdsa"] })
extern class Signature {

    @:native("R") var R: go.Slice<go.Byte>;
    @:native("S") var S: go.Slice<go.Byte>;

function new(R: go.Slice<go.Byte>, S: go.Slice<go.Byte>);

}