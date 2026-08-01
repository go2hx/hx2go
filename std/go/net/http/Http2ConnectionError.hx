package go.net.http;

@:go.Type({ name: "http2ConnectionError", instanceName: "http.http2ConnectionError", imports: ["net/http"] })
extern typedef Http2ConnectionError = haxe.extern.EitherType<go.UInt32, {
    @:native("Error") function error(): (String);

}>