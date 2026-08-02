package go.crypto.hpke;

@:structInit
@:go.Type({ name: "shakeKDF", instanceName: "hpke.shakeKDF", imports: ["crypto/hpke"] })
extern class ShakeKDF {

    @:native("ID") function ID(): (go.UInt16);

}