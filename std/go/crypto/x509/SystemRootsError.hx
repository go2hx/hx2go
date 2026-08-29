package go.crypto.x509;

/**
    SystemRootsError results when we fail to load the system root certificates.
**/
@:structInit
@:go.Type({ name: "SystemRootsError", instanceName: "x509.SystemRootsError", imports: ["crypto/x509"] })
extern class SystemRootsError {

    @:native("Err") var err: go.Error;

    function new(err: go.Error=null);

    @:native("Error") function error(): (String);
    @:native("Unwrap") function unwrap(): (go.Error);

}