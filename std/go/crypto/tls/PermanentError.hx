package go.crypto.tls;

@:structInit
@:go.Type({ name: "permanentError", instanceName: "tls.permanentError", imports: ["crypto/tls"] })
extern class PermanentError {

    @:native("Error") function error(): (String);
    @:native("Temporary") function temporary(): (Bool);
    @:native("Timeout") function timeout(): (Bool);
    @:native("Unwrap") function unwrap(): (go.Error);

}