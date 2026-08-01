package go.crypto.hpke;

@:structInit
@:go.Type({ name: "aead", instanceName: "hpke.aead", imports: ["crypto/hpke"] })
extern class Aead {

    @:native("ID") function ID(): (go.UInt16);

}