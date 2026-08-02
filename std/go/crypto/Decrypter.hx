package go.crypto;

@:go.Type({ name: "Decrypter", instanceName: "crypto.Decrypter", imports: ["crypto"] })
extern typedef Decrypter = {

    @:native("Decrypt") function decrypt(rand: go.io.Reader, msg: go.Slice<go.Byte>, opts: go.crypto.DecrypterOpts): (go.Result<go.Slice<go.Byte>>);
    @:native("Public") function _public(): (go.crypto.PublicKey);

}