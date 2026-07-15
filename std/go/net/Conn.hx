package go.net;

@:go.Type({ name: "Conn", instanceName: "net.Conn", imports: ["net"] })
extern typedef Conn = {

    @:native("Close") function close(): go.Error;
    @:native("LocalAddr") function localAddr(): go.net.Addr;
    @:native("Read") function read(b: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("RemoteAddr") function remoteAddr(): go.net.Addr;
    @:native("SetDeadline") function setDeadline(t: go.time.Time): go.Error;
    @:native("SetReadDeadline") function setReadDeadline(t: go.time.Time): go.Error;
    @:native("SetWriteDeadline") function setWriteDeadline(t: go.time.Time): go.Error;
    @:native("Write") function write(b: go.Slice<go.Byte>): go.Result<go.GoInt>;

}