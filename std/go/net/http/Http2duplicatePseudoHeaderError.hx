package go.net.http;

@:go.Type({ name: "http2duplicatePseudoHeaderError", instanceName: "http.http2duplicatePseudoHeaderError", imports: ["net/http"] })
extern typedef Http2duplicatePseudoHeaderError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>