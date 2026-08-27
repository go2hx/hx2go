package go.net.http.httptrace;

@:structInit
@:go.Type({ name: "ClientTrace", instanceName: "httptrace.ClientTrace", imports: ["net/http/httptrace"] })
extern class ClientTrace {

    @:native("GetConn") var getConn: (hostPort: String) -> Void;
    @:native("GotConn") var gotConn: (p0: go.net.http.httptrace.GotConnInfo) -> Void;
    @:native("PutIdleConn") var putIdleConn: (err: go.Error) -> Void;
    @:native("GotFirstResponseByte") var gotFirstResponseByte: () -> Void;
    @:native("Got100Continue") var got100Continue: () -> Void;
    @:native("Got1xxResponse") var got1xxResponse: (code: go.GoInt, header: go.net.textproto.MIMEHeader) -> (go.Error);
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

    function new(getConn: (hostPort: String) -> Void=null, gotConn: (p0: go.net.http.httptrace.GotConnInfo) -> Void=null, putIdleConn: (err: go.Error) -> Void=null, gotFirstResponseByte: () -> Void=null, got100Continue: () -> Void=null, got1xxResponse: (code: go.GoInt, header: go.net.textproto.MIMEHeader) -> (go.Error)=null, dNSStart: (p0: go.net.http.httptrace.DNSStartInfo) -> Void=null, dNSDone: (p0: go.net.http.httptrace.DNSDoneInfo) -> Void=null, connectStart: (network: String, addr: String) -> Void=null, connectDone: (network: String, addr: String, err: go.Error) -> Void=null, tLSHandshakeStart: () -> Void=null, tLSHandshakeDone: (p0: go.crypto.tls.ConnectionState, p1: go.Error) -> Void=null, wroteHeaderField: (key: String, value: go.Slice<String>) -> Void=null, wroteHeaders: () -> Void=null, wait100Continue: () -> Void=null, wroteRequest: (p0: go.net.http.httptrace.WroteRequestInfo) -> Void=null);

}