package go.crypto.hpke;

/**
    The KDF is one of the three components of an HPKE ciphersuite, implementing
    key derivation.
**/
@:go.Type({ name: "KDF", instanceName: "hpke.KDF", imports: ["crypto/hpke"] })
extern typedef KDF = {

    @:native("ID") function ID(): (go.UInt16);

}