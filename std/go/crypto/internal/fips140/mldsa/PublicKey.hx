package go.crypto.internal.fips140.mldsa;

@:structInit
@:go.Type({ name: "PublicKey", instanceName: "mldsa.PublicKey", imports: ["crypto/internal/fips140/mldsa"] })
extern class PublicKey {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("Equal") function equal(x: go.Pointer<go.crypto.internal.fips140.mldsa.PublicKey>): Bool;
    @:native("Parameters") function parameters(): String;

}