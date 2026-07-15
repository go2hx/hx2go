package go.crypto.hpke;

@:go.Type({ name: "PrivateKey", instanceName: "hpke.PrivateKey", imports: ["crypto/hpke"] })
extern typedef PrivateKey = {

    @:native("Bytes") function bytes(): go.Result<go.Slice<go.Byte>>;
    @:native("KEM") function KEM(): go.crypto.hpke.KEM;
    @:native("PublicKey") function publicKey(): go.crypto.hpke.PublicKey;

}