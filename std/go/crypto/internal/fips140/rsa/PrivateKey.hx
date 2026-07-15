package go.crypto.internal.fips140.rsa;

@:structInit
@:go.Type({ name: "PrivateKey", instanceName: "rsa.PrivateKey", imports: ["crypto/internal/fips140/rsa"] })
extern class PrivateKey {

    @:go.Tuple("N", "e", "d", "P", "Q", "dP", "dQ", "qInv") @:native("Export") function export(): go.Tuple<{ N: go.Slice<go.Byte>, e: go.GoInt, d: go.Slice<go.Byte>, P: go.Slice<go.Byte>, Q: go.Slice<go.Byte>, dP: go.Slice<go.Byte>, dQ: go.Slice<go.Byte>, qInv: go.Slice<go.Byte> }>;
    @:native("PublicKey") function publicKey(): go.Pointer<go.crypto.internal.fips140.rsa.PublicKey>;

}