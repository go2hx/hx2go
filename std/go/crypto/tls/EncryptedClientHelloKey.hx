package go.crypto.tls;

/**
    EncryptedClientHelloKey holds a private key that is associated
    with a specific ECH config known to a client.
**/
@:structInit
@:go.Type({ name: "EncryptedClientHelloKey", instanceName: "tls.EncryptedClientHelloKey", imports: ["crypto/tls"] })
extern class EncryptedClientHelloKey {

    @:native("Config") var config: go.Slice<go.Byte>;
    @:native("PrivateKey") var privateKey: go.Slice<go.Byte>;
    @:native("SendAsRetry") var sendAsRetry: Bool;

    function new(config: go.Slice<go.Byte>=null, privateKey: go.Slice<go.Byte>=null, sendAsRetry: Bool=false);

}