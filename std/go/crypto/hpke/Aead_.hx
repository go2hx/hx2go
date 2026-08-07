package go.crypto.hpke;

@:structInit
@:go.Type({ name: "aead", instanceName: "hpke.aead", imports: ["crypto/hpke"] })
extern class Aead_ {

    @:native("ID") function ID(): (go.UInt16);

}