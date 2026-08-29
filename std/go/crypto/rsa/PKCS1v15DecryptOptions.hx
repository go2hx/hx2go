package go.crypto.rsa;

/**
    PKCS1v15DecryptOptions is for passing options to PKCS #1 v1.5 decryption using
    the [crypto.Decrypter] interface.
    
    Deprecated: PKCS #1 v1.5 encryption is dangerous and should not be used.
    See [draft-irtf-cfrg-rsa-guidance-05] for more information. Use
    [EncryptOAEP] and [DecryptOAEP] instead.
    
    [draft-irtf-cfrg-rsa-guidance-05]: https://www.ietf.org/archive/id/draft-irtf-cfrg-rsa-guidance-05.html#name-rationale
**/
@:structInit
@:go.Type({ name: "PKCS1v15DecryptOptions", instanceName: "rsa.PKCS1v15DecryptOptions", imports: ["crypto/rsa"] })
extern class PKCS1v15DecryptOptions {

    @:native("SessionKeyLen") var sessionKeyLen: go.GoInt;

    function new(sessionKeyLen: go.GoInt=0);

}