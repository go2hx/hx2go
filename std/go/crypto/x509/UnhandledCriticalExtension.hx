package go.crypto.x509;

@:structInit
@:go.Type({ name: "UnhandledCriticalExtension", instanceName: "x509.UnhandledCriticalExtension", imports: ["crypto/x509"] })
extern class UnhandledCriticalExtension {

    @:native("Error") function error(): String;

}