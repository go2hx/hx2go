package go.net.http;

@:structInit
@:go.Type({ name: "http2RSTStreamFrame", instanceName: "http.http2RSTStreamFrame", imports: ["net/http"] })
extern class Http2RSTStreamFrame {

    @:native("ErrCode") var errCode: go.net.http.Http2ErrCode;
    @:native("Type") var type: go.net.http.Http2FrameType;
    @:native("Flags") var flags: go.net.http.Http2Flags;
    @:native("Length") var length: go.UInt32;
    @:native("StreamID") var streamID: go.UInt32;

    function new(errCode: go.net.http.Http2ErrCode);

    @:native("Header") function header(): (go.net.http.Http2FrameHeader);
    @:native("String") function string(): (String);

}