package go.net.http.httptrace;

@:structInit
@:go.Type({ name: "ClientTrace", instanceName: "httptrace.ClientTrace", imports: ["net/http/httptrace"] })
extern class ClientTrace {

    @:native("GetConn") var getConn: (hostPort: String) -> Void;
    @:native("GotConn") var gotConn: (p0: go.net.http.httptrace.GotConnInfo) -> Void;
    @:native("PutIdleConn") var putIdleConn: (err: go.Error) -> Void;
    @:native("GotFirstResponseByte") var gotFirstResponseByte: () -> Void;
    @:native("Got100Continue") var got100Continue: () -> Void;
    @:native("Got1xxResponse") var got1xxResponse: (code: go.GoInt, header: go.net.textproto.MIMEHeader) -> go.Error;
    @:native("DNSStart") var dNSStart: (p0: go.net.http.httptrace.DNSStartInfo) -> Void;
    @:native("DNSDone") var dNSDone: (p0: go.net.http.httptrace.DNSDoneInfo) -> Void;
    @:native("ConnectStart") var connectStart: (network: String, addr: String) -> Void;
    @:native("ConnectDone") var connectDone: (network: String, addr: String, err: go.Error) -> Void;
    @:native("TLSHandshakeStart") var tLSHandshakeStart: () -> Void;
    @:native("TLSHandshakeDone") var tLSHandshakeDone: (p0: go.crypto.tls.ConnectionState, p1: go.Error) -> Void;
    @:native("WroteHeaderField") var wroteHeaderField: (key: String, value: go.Slice<String>) -> Void;
    @:native("WroteHeaders") var wroteHeaders: () -> Void;
    @:native("Wait100Continue") var wait100Continue: () -> Void;
    @:native("WroteRequest") var wroteRequest: (p0: go.net.http.httptrace.WroteRequestInfo) -> Void;

function new(getConn: (hostPort: String) -> Void, gotConn: (p0: go.net.http.httptrace.GotConnInfo) -> Void, putIdleConn: (err: go.Error) -> Void, gotFirstResponseByte: () -> Void, got100Continue: () -> Void, got1xxResponse: (code: go.GoInt, header: go.net.textproto.MIMEHeader) -> go.Error, dNSStart: (p0: go.net.http.httptrace.DNSStartInfo) -> Void, dNSDone: (p0: go.net.http.httptrace.DNSDoneInfo) -> Void, connectStart: (network: String, addr: String) -> Void, connectDone: (network: String, addr: String, err: go.Error) -> Void, tLSHandshakeStart: () -> Void, tLSHandshakeDone: (p0: go.crypto.tls.ConnectionState, p1: go.Error) -> Void, wroteHeaderField: (key: String, value: go.Slice<String>) -> Void, wroteHeaders: () -> Void, wait100Continue: () -> Void, wroteRequest: (p0: go.net.http.httptrace.WroteRequestInfo) -> Void);

}