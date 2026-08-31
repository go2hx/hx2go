package go.net.http.httputil;

@:structInit
@:go.Type({ name: "dumpConn", instanceName: "httputil.dumpConn", imports: ["net/http/httputil"] })
extern class DumpConn {

    @:native("Writer") var writer: go.io.Writer;
    @:native("Reader") var reader: go.io.Reader;

    function new(writer: go.io.Writer=null, reader: go.io.Reader=null);

    @:native("Close") function close(): (go.Error);
    @:native("LocalAddr") function localAddr(): (go.net.Addr);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("RemoteAddr") function remoteAddr(): (go.net.Addr);
    @:native("SetDeadline") function setDeadline(t: go.time.Time): (go.Error);
    @:native("SetReadDeadline") function setReadDeadline(t: go.time.Time): (go.Error);
    @:native("SetWriteDeadline") function setWriteDeadline(t: go.time.Time): (go.Error);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}