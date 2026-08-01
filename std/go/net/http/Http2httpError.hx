package go.net.http;

@:structInit
@:go.Type({ name: "http2httpError", instanceName: "http.http2httpError", imports: ["net/http"] })
extern class Http2httpError {

    @:native("Error") function error(): (String);
    @:native("Temporary") function temporary(): (Bool);
    @:native("Timeout") function timeout(): (Bool);

}