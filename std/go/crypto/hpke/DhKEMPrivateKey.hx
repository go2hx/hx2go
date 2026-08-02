package go.crypto.hpke;

@:structInit
@:go.Type({ name: "dhKEMPrivateKey", instanceName: "hpke.dhKEMPrivateKey", imports: ["crypto/hpke"] })
extern class DhKEMPrivateKey {

    @:native("Bytes") function bytes(): (go.Result<go.Slice<go.Byte>>);
    @:native("KEM") function KEM(): (go.crypto.hpke.KEM);
    @:native("PublicKey") function publicKey(): (go.crypto.hpke.PublicKey);

}