package go.net.http;

@:structInit
@:go.Type({ name: "http2goAwayFlowError", instanceName: "http.http2goAwayFlowError", imports: ["net/http"] })
extern class Http2goAwayFlowError {

    @:native("Error") function error(): (String);

}