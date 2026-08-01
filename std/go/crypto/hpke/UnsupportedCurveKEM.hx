package go.crypto.hpke;

@:structInit
@:go.Type({ name: "unsupportedCurveKEM", instanceName: "hpke.unsupportedCurveKEM", imports: ["crypto/hpke"] })
extern class UnsupportedCurveKEM {

    @:native("DeriveKeyPair") function deriveKeyPair(p0: go.Slice<go.Byte>): (go.Result<go.crypto.hpke.PrivateKey>);
    @:native("GenerateKey") function generateKey(): (go.Result<go.crypto.hpke.PrivateKey>);
    @:native("ID") function ID(): (go.UInt16);
    @:native("NewPrivateKey") function newPrivateKey(p0: go.Slice<go.Byte>): (go.Result<go.crypto.hpke.PrivateKey>);
    @:native("NewPublicKey") function newPublicKey(p0: go.Slice<go.Byte>): (go.Result<go.crypto.hpke.PublicKey>);

}