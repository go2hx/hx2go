package go.crypto;

/**
    MessageSigner is an interface for an opaque private key that can be used for
    signing operations where the message is not pre-hashed by the caller.
    It is a superset of the Signer interface so that it can be passed to APIs
    which accept Signer, which may try to do an interface upgrade.
    
    MessageSigner.SignMessage and MessageSigner.Sign should produce the same
    result given the same opts. In particular, MessageSigner.SignMessage should
    only accept a zero opts.HashFunc if the Signer would also accept messages
    which are not pre-hashed.
    
    Implementations which do not provide the pre-hashed Sign API should implement
    Signer.Sign by always returning an error.
**/
@:go.Type({ name: "MessageSigner", instanceName: "crypto.MessageSigner", imports: ["crypto"] })
extern typedef MessageSigner = {

    @:native("Public") function _public(): (go.crypto.PublicKey);
    @:native("Sign") function sign(rand: go.io.Reader, digest: go.Slice<go.Byte>, opts: go.crypto.SignerOpts): (go.Result<go.Slice<go.Byte>>);
    @:native("SignMessage") function signMessage(rand: go.io.Reader, msg: go.Slice<go.Byte>, opts: go.crypto.SignerOpts): (go.Result<go.Slice<go.Byte>>);

}