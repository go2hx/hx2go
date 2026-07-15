package go.crypto.hpke;

@:go.Type({ name: "KDF", instanceName: "hpke.KDF", imports: ["crypto/hpke"] })
extern typedef KDF = {

    @:native("ID") function ID(): go.UInt16;

}