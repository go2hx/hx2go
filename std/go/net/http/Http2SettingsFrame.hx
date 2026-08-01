package go.net.http;

@:structInit
@:go.Type({ name: "http2SettingsFrame", instanceName: "http.http2SettingsFrame", imports: ["net/http"] })
extern class Http2SettingsFrame {

    @:native("Type") var type: go.net.http.Http2FrameType;
    @:native("Flags") var flags: go.net.http.Http2Flags;
    @:native("Length") var length: go.UInt32;
    @:native("StreamID") var streamID: go.UInt32;

    @:native("ForeachSetting") function foreachSetting(fn: (p0: go.net.http.Http2Setting) -> (go.Error)): (go.Error);
    @:native("HasDuplicates") function hasDuplicates(): (Bool);
    @:native("Header") function header(): (go.net.http.Http2FrameHeader);
    @:native("IsAck") function isAck(): (Bool);
    @:native("NumSettings") function numSettings(): (go.GoInt);
    @:native("Setting") function setting(i: go.GoInt): (go.net.http.Http2Setting);
    @:native("String") function string(): (String);
    @:go.Tuple("v", "ok") @:native("Value") function value(id: go.net.http.Http2SettingID): (go.Tuple<{ v: go.UInt32, ok: Bool }>);

}