package go.net.http;

@:go.Type({ name: "http2FrameType", instanceName: "http.http2FrameType", imports: ["net/http"] })
extern typedef Http2FrameType = haxe.extern.EitherType<go.UInt8, {
    @:native("String") function string(): (String);

}>