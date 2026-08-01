package go.net.http;

@:structInit
@:go.Type({ name: "http2GoAwayFrame", instanceName: "http.http2GoAwayFrame", imports: ["net/http"] })
extern class Http2GoAwayFrame {

    @:native("LastStreamID") var lastStreamID: go.UInt32;
    @:native("ErrCode") var errCode: go.net.http.Http2ErrCode;
    @:native("Type") var type: go.net.http.Http2FrameType;
    @:native("Flags") var flags: go.net.http.Http2Flags;
    @:native("Length") var length: go.UInt32;
    @:native("StreamID") var streamID: go.UInt32;

    function new(lastStreamID: go.UInt32, errCode: go.net.http.Http2ErrCode);

    @:native("DebugData") function debugData(): (go.Slice<go.Byte>);
    @:native("Header") function header(): (go.net.http.Http2FrameHeader);
    @:native("String") function string(): (String);

}