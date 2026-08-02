package go.crypto.hpke;

@:structInit
@:go.Type({ name: "dhKEMPublicKey", instanceName: "hpke.dhKEMPublicKey", imports: ["crypto/hpke"] })
extern class DhKEMPublicKey {

    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    @:native("KEM") function KEM(): (go.crypto.hpke.KEM);

}