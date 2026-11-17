package go.net.http;

@:go.Type({ name: "http2Flags", instanceName: "http.http2Flags", imports: ["net/http"] })
extern typedef Http2Flags = haxe.extern.EitherType<go.UInt8, {
    @:native("Has") function has(v: go.net.http.Http2Flags): (Bool);

}>