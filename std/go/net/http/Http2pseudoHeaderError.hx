package go.net.http;

@:go.Type({ name: "http2pseudoHeaderError", instanceName: "http.http2pseudoHeaderError", imports: ["net/http"] })
extern typedef Http2pseudoHeaderError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>