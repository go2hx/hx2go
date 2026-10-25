package go.net.http.httptest;

/**
    A Server is an HTTP server for use in end-to-end HTTP tests.
    
    Most tests should create a server with [NewTestServer].
    The [Server.Client] method returns a client which sends requests to the test server.
    
    	// Create a test server and send a request to it.
    	server := httptest.NewTestServer(t, handler)
    	resp, err := server.Client().Get("http://www.example.com/")
    
    # Configuration
    
    Tests may change a Server's configuration prior to using it.
    The configuration must not be changed after the first call to
    [Server.Client], [Server.Start], or [Server.StartTLS].
    
    	// Configure a test server before using.
    	server := httptest.NewTestServer(t, handler)
    	server.Config.MaxHeaderBytes = 1024
    	resp, err := server.Client().Get("http://www.example.com/")
    
    # Tests
    
    Servers created with [NewTestServer] will:
    
      - Fail the test if the server handler panics with
        any value other than [http.ErrAbortHandler].
      - Register a Cleanup function to shut down the server at the end of the test.
    
    Servers created in any other way must be manually shut down with [Server.Close].
    
    # In-Memory Network
    
    A Server may use an in-memory network implementation or
    listen on a local network loopback interface.
    Most tests should use the in-memory network,
    which avoids port exhaustion and other transient networking issues
    and is suitable for use with the [testing/synctest] package.
    
    To use the in-memory network, create a server with [NewTestServer].
    Do not call [Server.Start] or [Server.StartTLS].
    
    When using the in-memory network, the [http.Client] returned by [Server.Client]
    is configured to send all requests to the server.
    The client will direct HTTP and HTTPS requests,
    regardless of destination address or hostname, to the server.
    Requests do not need to use [Server.URL] as the base URL.
    
    	server := httptest.NewTestServer(t, handler)
    	client := server.Client()
    
    	// All of these requests are sent to the test server.
    	// https:// requests use TLS over the in-memory network.
    	_, _ = client.Get("http://www.example.com/")
    	_, _ = client.Get("https://go.dev/")
    	_, _ = client.Get("http://10.0.0.1/")
    
    The [Server.Listener] field is not set when using the in-memory network.
    
    # Loopback Network
    
    To listen on a loopback interface, call [Server.Start] or [Server.StartTLS].
    The server will listen on a system-chosen port.
    
    Loopback servers serve one of HTTP (when started with [Server.Start])
    or HTTPS (when started with [Server.StartTLS]).
    
    When using the loopback network, the [http.Client] returned by [Server.Client]
    is configured to send requests with a hostname of "example.com" or a subdomain
    of ".example.com" to the server.
    
    Requests may also be sent to the server's loopback address.
    The [Server.URL] field is set to a base URL containing the server's address.
    
    	server := httptest.NewTestServer(t, handler)
    	server.Start()
    	client := server.Client()
    
    	// This request is sent to the test server.
    	_, _ = server.Client().Get(server.URL + "/")
    
    	// This request (using http.DefaultClient) is also sent to the test server,
    	// since server.URL contains the server's local IP address.
    	_, _ = http.Get(server.URL + "/")
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
        Start starts a server on a local loopback network interface.
        
        The server should have been created by [NewTestServer] or [NewUnstartedServer].
    **/
    @:native("Start") function start(): Void;
    /**
        Start starts TLS on a server on a local loopback network interface.
        
        The server should have been created by [NewTestServer] or [NewUnstartedServer].
    **/
    @:native("StartTLS") function startTLS(): Void;

}