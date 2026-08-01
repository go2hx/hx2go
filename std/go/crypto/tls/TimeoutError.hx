package go.crypto.tls;

@:structInit
@:go.Type({ name: "timeoutError", instanceName: "tls.timeoutError", imports: ["crypto/tls"] })
extern class TimeoutError {

    @:native("Error") function error(): (String);
    @:native("Temporary") function temporary(): (Bool);
    @:native("Timeout") function timeout(): (Bool);

}