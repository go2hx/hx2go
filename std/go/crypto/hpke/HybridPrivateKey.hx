package go.crypto.hpke;

@:structInit
@:go.Type({ name: "hybridPrivateKey", instanceName: "hpke.hybridPrivateKey", imports: ["crypto/hpke"] })
extern class HybridPrivateKey {

    @:native("Bytes") function bytes(): (go.Result<go.Slice<go.Byte>>);
    @:native("KEM") function KEM(): (go.crypto.hpke.KEM);
    @:native("PublicKey") function publicKey(): (go.crypto.hpke.PublicKey);

}