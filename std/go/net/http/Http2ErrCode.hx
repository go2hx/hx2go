package go.net.http;

@:go.Type({ name: "http2ErrCode", instanceName: "http.http2ErrCode", imports: ["net/http"] })
extern typedef Http2ErrCode = haxe.extern.EitherType<go.UInt32, {
    @:native("String") function string(): (String);

}>