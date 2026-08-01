package go.crypto.hpke;

@:structInit
@:go.Type({ name: "hybridKEM", instanceName: "hpke.hybridKEM", imports: ["crypto/hpke"] })
extern class HybridKEM {

    @:native("DeriveKeyPair") function deriveKeyPair(ikm: go.Slice<go.Byte>): (go.Result<go.crypto.hpke.PrivateKey>);
    @:native("GenerateKey") function generateKey(): (go.Result<go.crypto.hpke.PrivateKey>);
    @:native("ID") function ID(): (go.UInt16);
    @:native("NewPrivateKey") function newPrivateKey(priv: go.Slice<go.Byte>): (go.Result<go.crypto.hpke.PrivateKey>);
    @:native("NewPublicKey") function newPublicKey(data: go.Slice<go.Byte>): (go.Result<go.crypto.hpke.PublicKey>);

}