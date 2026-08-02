package go.crypto.hpke;

@:structInit
@:go.Type({ name: "mlkemPublicKey", instanceName: "hpke.mlkemPublicKey", imports: ["crypto/hpke"] })
extern class MlkemPublicKey {

    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    @:native("KEM") function KEM(): (go.crypto.hpke.KEM);

}