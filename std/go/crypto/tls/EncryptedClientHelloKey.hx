package go.crypto.tls;

@:structInit
@:go.Type({ name: "EncryptedClientHelloKey", instanceName: "tls.EncryptedClientHelloKey", imports: ["crypto/tls"] })
extern class EncryptedClientHelloKey {

    @:native("Config") var config: go.Slice<go.Byte>;
    @:native("PrivateKey") var privateKey: go.Slice<go.Byte>;
    @:native("SendAsRetry") var sendAsRetry: Bool;

function new(config: go.Slice<go.Byte>, privateKey: go.Slice<go.Byte>, sendAsRetry: Bool);

}