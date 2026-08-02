package go.crypto.hpke;

@:structInit
@:go.Type({ name: "hybridPublicKey", instanceName: "hpke.hybridPublicKey", imports: ["crypto/hpke"] })
extern class HybridPublicKey {

    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    @:native("KEM") function KEM(): (go.crypto.hpke.KEM);

}