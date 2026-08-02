package go.crypto.hpke;

@:structInit
@:go.Type({ name: "hkdfKDF", instanceName: "hpke.hkdfKDF", imports: ["crypto/hpke"] })
extern class HkdfKDF {

    @:native("ID") function ID(): (go.UInt16);

}