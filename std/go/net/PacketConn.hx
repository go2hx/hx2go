package go.net;

@:go.Type({ name: "PacketConn", instanceName: "net.PacketConn", imports: ["net"] })
extern typedef PacketConn = {

    @:native("Close") function close(): go.Error;
    @:native("LocalAddr") function localAddr(): go.net.Addr;
    @:go.Tuple("n", "addr", "err") @:native("ReadFrom") function readFrom(p: go.Slice<go.Byte>): go.Tuple<{ n: go.GoInt, addr: go.net.Addr, err: go.Error }>;
    @:native("SetDeadline") function setDeadline(t: go.time.Time): go.Error;
    @:native("SetReadDeadline") function setReadDeadline(t: go.time.Time): go.Error;
    @:native("SetWriteDeadline") function setWriteDeadline(t: go.time.Time): go.Error;
    @:native("WriteTo") function writeTo(p: go.Slice<go.Byte>, addr: go.net.Addr): go.Result<go.GoInt>;

}