package go.crypto.hpke;

@:go.Type({ name: "PublicKey", instanceName: "hpke.PublicKey", imports: ["crypto/hpke"] })
extern typedef PublicKey = {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("KEM") function KEM(): go.crypto.hpke.KEM;

}