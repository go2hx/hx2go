package go.net.http;

@:structInit
@:go.Type({ name: "http2Framer", instanceName: "http.http2Framer", imports: ["net/http"] })
extern class Http2Framer {

    @:native("AllowIllegalWrites") var allowIllegalWrites: Bool;
    @:native("AllowIllegalReads") var allowIllegalReads: Bool;
    @:native("ReadMetaHeaders") var readMetaHeaders: go.Pointer<Dynamic>;
    @:native("MaxHeaderListSize") var maxHeaderListSize: go.UInt32;

    function new(allowIllegalWrites: Bool=false, allowIllegalReads: Bool=false, readMetaHeaders: go.Pointer<Dynamic>=null, maxHeaderListSize: go.UInt32=0);

    @:native("ErrorDetail") function errorDetail(): (go.Error);
    @:native("ReadFrame") function readFrame(): (go.Result<go.net.http.Http2Frame>);
    @:native("ReadFrameForHeader") function readFrameForHeader(fh: go.net.http.Http2FrameHeader): (go.Result<go.net.http.Http2Frame>);
    @:native("ReadFrameHeader") function readFrameHeader(): (go.Result<go.net.http.Http2FrameHeader>);
    @:native("SetMaxReadFrameSize") function setMaxReadFrameSize(v: go.UInt32): Void;
    @:native("SetReuseFrames") function setReuseFrames(): Void;
    @:native("WriteContinuation") function writeContinuation(streamID: go.UInt32, endHeaders: Bool, headerBlockFragment: go.Slice<go.Byte>): (go.Error);
    @:native("WriteData") function writeData(streamID: go.UInt32, endStream: Bool, data: go.Slice<go.Byte>): (go.Error);
    @:native("WriteDataPadded") function writeDataPadded(streamID: go.UInt32, endStream: Bool, data: go.Slice<go.Byte>, pad: go.Slice<go.Byte>): (go.Error);
    @:native("WriteGoAway") function writeGoAway(maxStreamID: go.UInt32, code: go.net.http.Http2ErrCode, debugData: go.Slice<go.Byte>): (go.Error);
    @:native("WriteHeaders") function writeHeaders(p: go.net.http.Http2HeadersFrameParam): (go.Error);
    @:native("WritePing") function writePing(ack: Bool, data: go.GoArray<go.Byte, 8>): (go.Error);
    @:native("WritePriority") function writePriority(streamID: go.UInt32, p: go.net.http.Http2PriorityParam): (go.Error);
    @:native("WritePushPromise") function writePushPromise(p: go.net.http.Http2PushPromiseParam): (go.Error);
    @:native("WriteRSTStream") function writeRSTStream(streamID: go.UInt32, code: go.net.http.Http2ErrCode): (go.Error);
    @:native("WriteRawFrame") function writeRawFrame(t: go.net.http.Http2FrameType, flags: go.net.http.Http2Flags, streamID: go.UInt32, payload: go.Slice<go.Byte>): (go.Error);
    @:native("WriteSettings") function writeSettings(settings: haxe.Rest<go.net.http.Http2Setting>): (go.Error);
    @:native("WriteSettingsAck") function writeSettingsAck(): (go.Error);
    @:native("WriteWindowUpdate") function writeWindowUpdate(streamID: go.UInt32, incr: go.UInt32): (go.Error);

}