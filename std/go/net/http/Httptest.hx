package go.net.http;

/**
    Package httptest provides utilities for HTTP testing.
**/
@:go.Type({ name: "httptest", instanceName: "httptest.httptest", imports: ["net/http/httptest"] })
extern class Httptest {

    /**
        DefaultRemoteAddr is the default remote address to return in RemoteAddr if
        an explicit DefaultRemoteAddr isn't set on [ResponseRecorder].
    **/
    @:native("DefaultRemoteAddr") static var defaultRemoteAddr: String;

    /**
        NewRecorder returns an initialized [ResponseRecorder].
    **/
    @:native("NewRecorder") static function newRecorder(): (go.Pointer<go.net.http.httptest.ResponseRecorder>);
    /**
        NewRequest wraps NewRequestWithContext using context.Background.
    **/
    @:native("NewRequest") static function newRequest(method: String, target: String, body: go.io.Reader): (go.Pointer<go.net.http.Request>);
    /**
        NewRequestWithContext returns a new incoming server Request, suitable
        for passing to an [http.Handler] for testing.
        
        The target is the RFC 7230 "request-target": it may be either a
        path or an absolute URL. If target is an absolute URL, the host name
        from the URL is used. Otherwise, "example.com" is used.
        
        The TLS field is set to a non-nil dummy value if target has scheme
        "https".
        
        The Request.Proto is always HTTP/1.1.
        
        An empty method means "GET".
        
        The provided body may be nil. If the body is of type [bytes.Reader],
        [strings.Reader], [bytes.Buffer], or the value [http.NoBody],
        the Request.ContentLength is set.
        
        NewRequest panics on error for ease of use in testing, where a
        panic is acceptable.
        
        To generate a client HTTP request instead of a server request, see
        the NewRequest function in the net/http package.
    **/
    @:native("NewRequestWithContext") static function newRequestWithContext(ctx: go.context.Context, method: String, target: String, body: go.io.Reader): (go.Pointer<go.net.http.Request>);
    /**
        NewServer starts and returns a new [Server].
        The caller should call Close when finished, to shut it down.
    **/
    @:native("NewServer") static function newServer(handler: go.net.http.Handler): (go.Pointer<go.net.http.httptest.Server>);
    /**
        NewTLSServer starts and returns a new [Server] using TLS.
        The caller should call Close when finished, to shut it down.
    **/
    @:native("NewTLSServer") static function newTLSServer(handler: go.net.http.Handler): (go.Pointer<go.net.http.httptest.Server>);
    /**
        NewUnstartedServer returns a new [Server] but doesn't start it.
        
        After changing its configuration, the caller should call Start or
        StartTLS.
        
        The caller should call Close when finished, to shut it down.
    **/
    @:native("NewUnstartedServer") static function newUnstartedServer(handler: go.net.http.Handler): (go.Pointer<go.net.http.httptest.Server>);

}