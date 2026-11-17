package go.net.http;

@:structInit
@:go.Type({ name: "http2connError", instanceName: "http.http2connError", imports: ["net/http"] })
extern class Http2connError {

    @:native("Code") var code: go.net.http.Http2ErrCode;
    @:native("Reason") var reason: String;

    function new(code: go.net.http.Http2ErrCode=cast 0, reason: String="");

    @:native("Error") function error(): (String);

}