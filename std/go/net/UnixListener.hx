package go.net;

@:structInit
@:go.Type({ name: "UnixListener", instanceName: "net.UnixListener", imports: ["net"] })
extern class UnixListener {

    @:native("Accept") function accept(): go.Result<go.net.Conn>;
    @:native("AcceptUnix") function acceptUnix(): go.Result<go.Pointer<go.net.UnixConn>>;
    @:native("Addr") function addr(): go.net.Addr;
    @:native("Close") function close(): go.Error;
    @:native("File") function file(): go.Result<go.Pointer<go.os.File>>;
    @:native("SetDeadline") function setDeadline(t: go.time.Time): go.Error;
    @:native("SetUnlinkOnClose") function setUnlinkOnClose(unlink: Bool): Void;
    @:native("SyscallConn") function syscallConn(): go.Result<go.syscall.RawConn>;

}