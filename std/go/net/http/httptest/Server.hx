package go.net.http.httptest;

/**
    A Server is an HTTP server listening on a system-chosen port on the
    local loopback interface, for use in end-to-end HTTP tests.
**/
@:structInit
@:go.Type({ name: "Server", instanceName: "httptest.Server", imports: ["net/http/httptest"] })
extern class Server {

    @:native("URL") var URL: String;
    @:native("Listener") var listener: go.net.Listener;
    @:native("EnableHTTP2") var enableHTTP2: Bool;
    @:native("TLS") var TLS: go.Pointer<go.crypto.tls.Config>;
    @:native("Config") var config: go.Pointer<go.net.http.Server>;

    function new(URL: String="", listener: go.net.Listener=null, enableHTTP2: Bool=false, TLS: go.Pointer<go.crypto.tls.Config>=null, config: go.Pointer<go.net.http.Server>=null);

    /**
        Certificate returns the certificate used by the server, or nil if
        the server doesn't use TLS.
    **/
    @:native("Certificate") function certificate(): (go.Pointer<go.crypto.x509.Certificate>);
    /**
        Client returns an HTTP client configured for making requests to the server.
        It is configured to trust the server's TLS test certificate and will
        close its idle connections on [Server.Close].
        Use Server.URL as the base URL to send requests to the server.
        The returned client will also redirect any requests to "example.com"
        or its subdomains to the server.
    **/
    @:native("Client") function client(): (go.Pointer<go.net.http.Client>);
    /**
        Close shuts down the server and blocks until all outstanding
        requests on this server have completed.
    **/
    @:native("Close") function close(): Void;
    /**
        CloseClientConnections closes any open HTTP connections to the test Server.
    **/
    @:native("CloseClientConnections") function closeClientConnections(): Void;
    /**
        Start starts a server from NewUnstartedServer.
    **/
    @:native("Start") function start(): Void;
    /**
        StartTLS starts TLS on a server from NewUnstartedServer.
    **/
    @:native("StartTLS") function startTLS(): Void;

}