package go.crypto;

@:go.Type({ name: "MessageSigner", instanceName: "crypto.MessageSigner", imports: ["crypto"] })
extern typedef MessageSigner = {

    @:native("Public") function _public(): go.crypto.PublicKey;
    @:native("Sign") function sign(rand: go.io.Reader, digest: go.Slice<go.Byte>, opts: go.crypto.SignerOpts): go.Result<go.Slice<go.Byte>>;
    @:native("SignMessage") function signMessage(rand: go.io.Reader, msg: go.Slice<go.Byte>, opts: go.crypto.SignerOpts): go.Result<go.Slice<go.Byte>>;

}