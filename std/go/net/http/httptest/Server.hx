package go.net.http.httptest;

@:structInit
@:go.Type({ name: "Server", instanceName: "httptest.Server", imports: ["net/http/httptest"] })
extern class Server {

    @:native("URL") var URL: String;
    @:native("Listener") var listener: go.net.Listener;
    @:native("EnableHTTP2") var enableHTTP2: Bool;
    @:native("TLS") var TLS: go.Pointer<go.crypto.tls.Config>;
    @:native("Config") var config: go.Pointer<go.net.http.Server>;

function new(URL: String, listener: go.net.Listener, enableHTTP2: Bool, TLS: go.Pointer<go.crypto.tls.Config>, config: go.Pointer<go.net.http.Server>);

    @:native("Certificate") function certificate(): go.Pointer<go.crypto.x509.Certificate>;
    @:native("Client") function client(): go.Pointer<go.net.http.Client>;
    @:native("Close") function close(): Void;
    @:native("CloseClientConnections") function closeClientConnections(): Void;
    @:native("Start") function start(): Void;
    @:native("StartTLS") function startTLS(): Void;

}