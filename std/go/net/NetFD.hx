package go.net;

@:structInit
@:go.Type({ name: "netFD", instanceName: "net.netFD", imports: ["net"] })
extern class NetFD {

    @:native("Close") function close(): (go.Error);
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("SetDeadline") function setDeadline(t: go.time.Time): (go.Error);
    @:native("SetReadDeadline") function setReadDeadline(t: go.time.Time): (go.Error);
    @:native("SetWriteDeadline") function setWriteDeadline(t: go.time.Time): (go.Error);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}