package go.net;

@:structInit
@:go.Type({ name: "TCPListener", instanceName: "net.TCPListener", imports: ["net"] })
extern class TCPListener {

    @:native("Accept") function accept(): go.Result<go.net.Conn>;
    @:native("AcceptTCP") function acceptTCP(): go.Result<go.Pointer<go.net.TCPConn>>;
    @:native("Addr") function addr(): go.net.Addr;
    @:native("Close") function close(): go.Error;
    @:native("File") function file(): go.Result<go.Pointer<go.os.File>>;
    @:native("SetDeadline") function setDeadline(t: go.time.Time): go.Error;
    @:native("SyscallConn") function syscallConn(): go.Result<go.syscall.RawConn>;

}