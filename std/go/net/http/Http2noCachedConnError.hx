package go.net.http;

@:structInit
@:go.Type({ name: "http2noCachedConnError", instanceName: "http.http2noCachedConnError", imports: ["net/http"] })
extern class Http2noCachedConnError {

    @:native("Error") function error(): (String);
    @:native("IsHTTP2NoCachedConnError") function isHTTP2NoCachedConnError(): Void;

}