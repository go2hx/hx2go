package go.crypto.tls;

@:structInit
@:go.Type({ name: "Conn", instanceName: "tls.Conn", imports: ["crypto/tls"] })
extern class Conn {

    @:native("Close") function close(): go.Error;
    @:native("CloseWrite") function closeWrite(): go.Error;
    @:native("ConnectionState") function connectionState(): go.crypto.tls.ConnectionState;
    @:native("Handshake") function handshake(): go.Error;
    @:native("HandshakeContext") function handshakeContext(ctx: go.context.Context): go.Error;
    @:native("LocalAddr") function localAddr(): go.net.Addr;
    @:native("NetConn") function netConn(): go.net.Conn;
    @:native("OCSPResponse") function oCSPResponse(): go.Slice<go.Byte>;
    @:native("Read") function read(b: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("RemoteAddr") function remoteAddr(): go.net.Addr;
    @:native("SetDeadline") function setDeadline(t: go.time.Time): go.Error;
    @:native("SetReadDeadline") function setReadDeadline(t: go.time.Time): go.Error;
    @:native("SetWriteDeadline") function setWriteDeadline(t: go.time.Time): go.Error;
    @:native("VerifyHostname") function verifyHostname(host: String): go.Error;
    @:native("Write") function write(b: go.Slice<go.Byte>): go.Result<go.GoInt>;

}