package go.crypto.hpke;

/**
    A PrivateKey is an instantiation of a KEM (one of the three components of
    an HPKE ciphersuite) with a decapsulation key (i.e. the secret key).
    
    A PrivateKey is usually obtained from a method of the corresponding [KEM],
    such as [KEM.GenerateKey] or [KEM.NewPrivateKey].
**/
@:go.Type({ name: "PrivateKey", instanceName: "hpke.PrivateKey", imports: ["crypto/hpke"] })
extern typedef PrivateKey = {

    @:native("Bytes") function bytes(): (go.Result<go.Slice<go.Byte>>);
    @:native("KEM") function KEM(): (go.crypto.hpke.KEM);
    @:native("PublicKey") function publicKey(): (go.crypto.hpke.PublicKey);

}