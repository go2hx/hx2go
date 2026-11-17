package go.net.http;

@:go.Type({ name: "http2SettingID", instanceName: "http.http2SettingID", imports: ["net/http"] })
extern typedef Http2SettingID = haxe.extern.EitherType<go.UInt16, {
    @:native("String") function string(): (String);

}>