package go.net.http.httputil;

/**
    A ProxyRequest contains a request to be rewritten by a [ReverseProxy].
**/
@:structInit
@:go.Type({ name: "ProxyRequest", instanceName: "httputil.ProxyRequest", imports: ["net/http/httputil"] })
extern class ProxyRequest {

    @:native("In") var _in: go.Pointer<go.net.http.Request>;
    @:native("Out") var out: go.Pointer<go.net.http.Request>;

    function new(_in: go.Pointer<go.net.http.Request>=null, out: go.Pointer<go.net.http.Request>=null);

    /**
        SetURL routes the outbound request to the scheme, host, and base path
        provided in target. If the target's path is "/base" and the incoming
        request was for "/dir", the target request will be for "/base/dir".
        To route requests without joining the incoming path,
        set r.Out.URL directly.
        
        SetURL rewrites the outbound Host header to match the target's host.
        To preserve the inbound request's Host header (the default behavior
        of [NewSingleHostReverseProxy]):
        
        	rewriteFunc := func(r *httputil.ProxyRequest) {
        		r.SetURL(url)
        		r.Out.Host = r.In.Host
        	}
    **/
    @:native("SetURL") function setURL(target: go.Pointer<go.net.url.URL>): Void;
    /**
        SetXForwarded sets the X-Forwarded-For, X-Forwarded-Host, and
        X-Forwarded-Proto headers of the outbound request.
        
          - The X-Forwarded-For header is set to the client IP address.
          - The X-Forwarded-Host header is set to the host name requested
            by the client.
          - The X-Forwarded-Proto header is set to "http" or "https", depending
            on whether the inbound request was made on a TLS-enabled connection.
        
        If the outbound request contains an existing X-Forwarded-For header,
        SetXForwarded appends the client IP address to it. To append to the
        inbound request's X-Forwarded-For header (the default behavior of
        [ReverseProxy] when using a Director function), copy the header
        from the inbound request before calling SetXForwarded:
        
        	rewriteFunc := func(r *httputil.ProxyRequest) {
        		r.Out.Header["X-Forwarded-For"] = r.In.Header["X-Forwarded-For"]
        		r.SetXForwarded()
        	}
    **/
    @:native("SetXForwarded") function setXForwarded(): Void;

}