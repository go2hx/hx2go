package go.net.http;

@:structInit
@:go.Type({ name: "response", instanceName: "http.response", imports: ["net/http"] })
extern class Response_ {

    @:native("CloseNotify") function closeNotify(): (go.Chan<Bool>);
    @:native("EnableFullDuplex") function enableFullDuplex(): (go.Error);
    @:native("Flush") function flush(): Void;
    @:native("FlushError") function flushError(): (go.Error);
    @:native("Header") function header(): (go.net.http.Header);
    @:go.Tuple("rwc", "buf", "err") @:native("Hijack") function hijack(): (go.Tuple<{ rwc: go.net.Conn, buf: go.Pointer<go.bufio.ReadWriter>, err: go.Error }>);
    @:native("ReadFrom") function readFrom(src: go.io.Reader): (go.Result<go.Int64>);
    @:native("SetReadDeadline") function setReadDeadline(deadline: go.time.Time): (go.Error);
    @:native("SetWriteDeadline") function setWriteDeadline(deadline: go.time.Time): (go.Error);
    @:native("Write") function write(data: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteHeader") function writeHeader(code: go.GoInt): Void;
    @:native("WriteString") function writeString(data: String): (go.Result<go.GoInt>);

}