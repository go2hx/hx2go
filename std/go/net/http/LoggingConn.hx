package go.net.http;

@:structInit
@:go.Type({ name: "loggingConn", instanceName: "http.loggingConn", imports: ["net/http"] })
extern class LoggingConn {

    @:native("Conn") var conn: go.net.Conn;

    function new(conn: go.net.Conn);

    @:native("Close") function close(): (go.Error);
    @:native("LocalAddr") function localAddr(): (go.net.Addr);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("RemoteAddr") function remoteAddr(): (go.net.Addr);
    @:native("SetDeadline") function setDeadline(t: go.time.Time): (go.Error);
    @:native("SetReadDeadline") function setReadDeadline(t: go.time.Time): (go.Error);
    @:native("SetWriteDeadline") function setWriteDeadline(t: go.time.Time): (go.Error);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}