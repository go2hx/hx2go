package go.crypto.hpke;

/**
    A KEM is a Key Encapsulation Mechanism, one of the three components of an
    HPKE ciphersuite.
**/
@:go.Type({ name: "KEM", instanceName: "hpke.KEM", imports: ["crypto/hpke"] })
extern typedef KEM = {

    @:native("DeriveKeyPair") function deriveKeyPair(ikm: go.Slice<go.Byte>): (go.Result<go.crypto.hpke.PrivateKey>);
    @:native("GenerateKey") function generateKey(): (go.Result<go.crypto.hpke.PrivateKey>);
    @:native("ID") function ID(): (go.UInt16);
    @:native("NewPrivateKey") function newPrivateKey(p0: go.Slice<go.Byte>): (go.Result<go.crypto.hpke.PrivateKey>);
    @:native("NewPublicKey") function newPublicKey(p0: go.Slice<go.Byte>): (go.Result<go.crypto.hpke.PublicKey>);

}