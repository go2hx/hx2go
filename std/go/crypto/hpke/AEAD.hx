package go.crypto.hpke;

/**
    The AEAD is one of the three components of an HPKE ciphersuite, implementing
    symmetric encryption.
**/
@:go.Type({ name: "AEAD", instanceName: "hpke.AEAD", imports: ["crypto/hpke"] })
extern typedef AEAD = {

    @:native("ID") function ID(): (go.UInt16);

}