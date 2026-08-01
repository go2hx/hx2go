package go.net;

@:structInit
@:go.Type({ name: "tcpConnWithoutWriteTo", instanceName: "net.tcpConnWithoutWriteTo", imports: ["net"] })
extern class TcpConnWithoutWriteTo {

    @:native("TCPConn") var tCPConn: go.Pointer<go.net.TCPConn>;

    function new(tCPConn: go.Pointer<go.net.TCPConn>);

    @:native("Close") function close(): (go.Error);
    @:native("CloseRead") function closeRead(): (go.Error);
    @:native("CloseWrite") function closeWrite(): (go.Error);
    @:native("File") function file(): (go.Result<go.Pointer<go.os.File>>);
    @:native("LocalAddr") function localAddr(): (go.net.Addr);
    @:native("MultipathTCP") function multipathTCP(): (go.Result<Bool>);
    @:native("Read") function read(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadFrom") function readFrom(r: go.io.Reader): (go.Result<go.Int64>);
    @:native("RemoteAddr") function remoteAddr(): (go.net.Addr);
    @:native("SetDeadline") function setDeadline(t: go.time.Time): (go.Error);
    @:native("SetKeepAlive") function setKeepAlive(keepalive: Bool): (go.Error);
    @:native("SetKeepAliveConfig") function setKeepAliveConfig(config: go.net.KeepAliveConfig): (go.Error);
    @:native("SetKeepAlivePeriod") function setKeepAlivePeriod(d: go.time.Duration): (go.Error);
    @:native("SetLinger") function setLinger(sec: go.GoInt): (go.Error);
    @:native("SetNoDelay") function setNoDelay(noDelay: Bool): (go.Error);
    @:native("SetReadBuffer") function setReadBuffer(bytes: go.GoInt): (go.Error);
    @:native("SetReadDeadline") function setReadDeadline(t: go.time.Time): (go.Error);
    @:native("SetWriteBuffer") function setWriteBuffer(bytes: go.GoInt): (go.Error);
    @:native("SetWriteDeadline") function setWriteDeadline(t: go.time.Time): (go.Error);
    @:native("SyscallConn") function syscallConn(): (go.Result<go.syscall.RawConn>);
    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}