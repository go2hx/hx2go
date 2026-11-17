package go.net.http;

@:go.Type({ name: "http2headerFieldValueError", instanceName: "http.http2headerFieldValueError", imports: ["net/http"] })
extern typedef Http2headerFieldValueError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>