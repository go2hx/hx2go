package go.crypto.hpke;

/**
    A PublicKey is an instantiation of a KEM (one of the three components of an
    HPKE ciphersuite) with an encapsulation key (i.e. the public key).
    
    A PublicKey is usually obtained from a method of the corresponding [KEM] or
    [PrivateKey], such as [KEM.NewPublicKey] or [PrivateKey.PublicKey].
**/
@:go.Type({ name: "PublicKey", instanceName: "hpke.PublicKey", imports: ["crypto/hpke"] })
extern typedef PublicKey = {

    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    @:native("KEM") function KEM(): (go.crypto.hpke.KEM);

}