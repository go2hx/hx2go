package go.net.http;

@:go.Type({ name: "http2headerFieldNameError", instanceName: "http.http2headerFieldNameError", imports: ["net/http"] })
extern typedef Http2headerFieldNameError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>