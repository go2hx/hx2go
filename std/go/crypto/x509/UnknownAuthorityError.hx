package go.crypto.x509;

@:structInit
@:go.Type({ name: "UnknownAuthorityError", instanceName: "x509.UnknownAuthorityError", imports: ["crypto/x509"] })
extern class UnknownAuthorityError {

    @:native("Cert") var cert: go.Pointer<go.crypto.x509.Certificate>;

function new(cert: go.Pointer<go.crypto.x509.Certificate>);

    @:native("Error") function error(): String;

}