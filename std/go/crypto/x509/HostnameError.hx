package go.crypto.x509;

@:structInit
@:go.Type({ name: "HostnameError", instanceName: "x509.HostnameError", imports: ["crypto/x509"] })
extern class HostnameError {

    @:native("Certificate") var certificate: go.Pointer<go.crypto.x509.Certificate>;
    @:native("Host") var host: String;

function new(certificate: go.Pointer<go.crypto.x509.Certificate>, host: String);

    @:native("Error") function error(): String;

}