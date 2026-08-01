package go.net;

@:structInit
@:go.Type({ name: "conn", instanceName: "net.conn", imports: ["net"] })
extern class Conn_ {

    @:native("Close") function close(): (go.Error);
    @:native("File") function file(): (go.Result<go.Pointer<go.os.File>>);
    @:native("LocalAddr") function localAddr(): (go.net.Addr);
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("RemoteAddr") function remoteAddr(): (go.net.Addr);
    @:native("SetDeadline") function setDeadline(t: go.time.Time): (go.Error);
    @:native("SetReadBuffer") function setReadBuffer(bytes: go.GoInt): (go.Error);
    @:native("SetReadDeadline") function setReadDeadline(t: go.time.Time): (go.Error);
    @:native("SetWriteBuffer") function setWriteBuffer(bytes: go.GoInt): (go.Error);
    @:native("SetWriteDeadline") function setWriteDeadline(t: go.time.Time): (go.Error);
    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}