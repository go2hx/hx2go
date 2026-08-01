package go.net.http;

@:structInit
@:go.Type({ name: "tlsHandshakeTimeoutError", instanceName: "http.tlsHandshakeTimeoutError", imports: ["net/http"] })
extern class TlsHandshakeTimeoutError {

    @:native("Error") function error(): (String);
    @:native("Temporary") function temporary(): (Bool);
    @:native("Timeout") function timeout(): (Bool);

}