package go.net;

@:structInit
@:go.Type({ name: "IPConn", instanceName: "net.IPConn", imports: ["net"] })
extern class IPConn {

    @:native("Close") function close(): go.Error;
    @:native("File") function file(): go.Result<go.Pointer<go.os.File>>;
    @:native("LocalAddr") function localAddr(): go.net.Addr;
    @:native("Read") function read(b: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:go.Tuple("p0", "p1", "p2") @:native("ReadFrom") function readFrom(b: go.Slice<go.Byte>): go.Tuple<{ p0: go.GoInt, p1: go.net.Addr, p2: go.Error }>;
    @:go.Tuple("p0", "p1", "p2") @:native("ReadFromIP") function readFromIP(b: go.Slice<go.Byte>): go.Tuple<{ p0: go.GoInt, p1: go.Pointer<go.net.IPAddr>, p2: go.Error }>;
    @:go.Tuple("n", "oobn", "flags", "addr", "err") @:native("ReadMsgIP") function readMsgIP(b: go.Slice<go.Byte>, oob: go.Slice<go.Byte>): go.Tuple<{ n: go.GoInt, oobn: go.GoInt, flags: go.GoInt, addr: go.Pointer<go.net.IPAddr>, err: go.Error }>;
    @:native("RemoteAddr") function remoteAddr(): go.net.Addr;
    @:native("SetDeadline") function setDeadline(t: go.time.Time): go.Error;
    @:native("SetReadBuffer") function setReadBuffer(bytes: go.GoInt): go.Error;
    @:native("SetReadDeadline") function setReadDeadline(t: go.time.Time): go.Error;
    @:native("SetWriteBuffer") function setWriteBuffer(bytes: go.GoInt): go.Error;
    @:native("SetWriteDeadline") function setWriteDeadline(t: go.time.Time): go.Error;
    @:native("SyscallConn") function syscallConn(): go.Result<go.syscall.RawConn>;
    @:native("Write") function write(b: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:go.Tuple("n", "oobn", "err") @:native("WriteMsgIP") function writeMsgIP(b: go.Slice<go.Byte>, oob: go.Slice<go.Byte>, addr: go.Pointer<go.net.IPAddr>): go.Tuple<{ n: go.GoInt, oobn: go.GoInt, err: go.Error }>;
    @:native("WriteTo") function writeTo(b: go.Slice<go.Byte>, addr: go.net.Addr): go.Result<go.GoInt>;
    @:native("WriteToIP") function writeToIP(b: go.Slice<go.Byte>, addr: go.Pointer<go.net.IPAddr>): go.Result<go.GoInt>;

}