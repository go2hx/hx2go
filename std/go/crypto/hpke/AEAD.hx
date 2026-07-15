package go.crypto.hpke;

@:go.Type({ name: "AEAD", instanceName: "hpke.AEAD", imports: ["crypto/hpke"] })
extern typedef AEAD = {

    @:native("ID") function ID(): go.UInt16;

}