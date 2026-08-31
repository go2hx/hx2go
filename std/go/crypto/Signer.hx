package go.crypto;

/**
    Signer is an interface for an opaque private key that can be used for
    signing operations. For example, an RSA key kept in a hardware module.
**/
@:go.Type({ name: "Signer", instanceName: "crypto.Signer", imports: ["crypto"] })
extern typedef Signer = {

    @:native("Public") function _public(): (go.crypto.PublicKey);
    @:native("Sign") function sign(rand: go.io.Reader, digest: go.Slice<go.Byte>, opts: go.crypto.SignerOpts): (go.Result<go.Slice<go.Byte>>);

}