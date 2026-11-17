package go.net.http;

@:structInit
@:go.Type({ name: "http2responseWriter", instanceName: "http.http2responseWriter", imports: ["net/http"] })
extern class Http2responseWriter {

    @:native("CloseNotify") function closeNotify(): (go.Chan<Bool>);
    @:native("EnableFullDuplex") function enableFullDuplex(): (go.Error);
    @:native("Flush") function flush(): Void;
    @:native("FlushError") function flushError(): (go.Error);
    @:native("Header") function header(): (go.net.http.Header);
    @:native("Push") function push(target: String, opts: go.Pointer<go.net.http.PushOptions>): (go.Error);
    @:native("SetReadDeadline") function setReadDeadline(deadline: go.time.Time): (go.Error);
    @:native("SetWriteDeadline") function setWriteDeadline(deadline: go.time.Time): (go.Error);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteHeader") function writeHeader(code: go.GoInt): Void;
    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);

}