package go.crypto.hpke;

@:structInit
@:go.Type({ name: "dhKEM", instanceName: "hpke.dhKEM", imports: ["crypto/hpke"] })
extern class DhKEM_ {

    @:native("Nsecret") var nsecret: go.UInt16;
    @:native("Nsk") var nsk: go.UInt16;
    @:native("Nenc") var nenc: go.GoInt;

    function new(nsecret: go.UInt16=0, nsk: go.UInt16=0, nenc: go.GoInt=0);

    @:native("DeriveKeyPair") function deriveKeyPair(ikm: go.Slice<go.Byte>): (go.Result<go.crypto.hpke.PrivateKey>);
    @:native("GenerateKey") function generateKey(): (go.Result<go.crypto.hpke.PrivateKey>);
    @:native("ID") function ID(): (go.UInt16);
    @:native("NewPrivateKey") function newPrivateKey(ikm: go.Slice<go.Byte>): (go.Result<go.crypto.hpke.PrivateKey>);
    @:native("NewPublicKey") function newPublicKey(data: go.Slice<go.Byte>): (go.Result<go.crypto.hpke.PublicKey>);

}