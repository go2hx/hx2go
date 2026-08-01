package go.net.http;

@:go.Type({ name: "http2streamState", instanceName: "http.http2streamState", imports: ["net/http"] })
extern typedef Http2streamState = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>