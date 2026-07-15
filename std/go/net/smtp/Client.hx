package go.net.smtp;

@:structInit
@:go.Type({ name: "Client", instanceName: "smtp.Client", imports: ["net/smtp"] })
extern class Client {

    @:native("Text") var text: go.Pointer<go.net.textproto.Conn>;

function new(text: go.Pointer<go.net.textproto.Conn>);

    @:native("Auth") function auth(a: go.net.smtp.Auth): go.Error;
    @:native("Close") function close(): go.Error;
    @:native("Data") function data(): go.Result<go.io.WriteCloser>;
    @:go.Tuple("p0", "p1") @:native("Extension") function extension(ext: String): go.Tuple<{ p0: Bool, p1: String }>;
    @:native("Hello") function hello(localName: String): go.Error;
    @:native("Mail") function mail(_from: String): go.Error;
    @:native("Noop") function noop(): go.Error;
    @:native("Quit") function quit(): go.Error;
    @:native("Rcpt") function rcpt(_to: String): go.Error;
    @:native("Reset") function reset(): go.Error;
    @:native("StartTLS") function startTLS(config: go.Pointer<go.crypto.tls.Config>): go.Error;
    @:go.Tuple("state", "ok") @:native("TLSConnectionState") function tLSConnectionState(): go.Tuple<{ state: go.crypto.tls.ConnectionState, ok: Bool }>;
    @:native("Verify") function verify(addr: String): go.Error;

}