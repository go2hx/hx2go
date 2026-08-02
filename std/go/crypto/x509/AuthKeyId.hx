package go.crypto.x509;

@:structInit
@:go.Type({ name: "authKeyId", instanceName: "x509.authKeyId", imports: ["crypto/x509"] })
extern class AuthKeyId {

    @:native("Id") var id: go.Slice<go.Byte>;

    function new(id: go.Slice<go.Byte>);

}