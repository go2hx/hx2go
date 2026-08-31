package go.net.http;

/**
    Package httputil provides HTTP utility functions, complementing the
    more common ones in the net/http package.
**/
@:go.Type({ name: "httputil", instanceName: "httputil.httputil", imports: ["net/http/httputil"] })
extern class Httputil {

    @:native("ErrClosed") static var errClosed: go.Pointer<go.net.http.ProtocolError>;
    @:native("ErrPersistEOF") static var errPersistEOF: go.Pointer<go.net.http.ProtocolError>;
    @:native("ErrPipeline") static var errPipeline: go.Pointer<go.net.http.ProtocolError>;

    /**
        DumpRequest returns the given request in its HTTP/1.x wire
        representation. It should only be used by servers to debug client
        requests. The returned representation is an approximation only;
        some details of the initial request are lost while parsing it into
        an [http.Request]. In particular, the order and case of header field
        names are lost. The order of values in multi-valued headers is kept
        intact. HTTP/2 requests are dumped in HTTP/1.x form, not in their
        original binary representations.
        
        If body is true, DumpRequest also returns the body. To do so, it
        consumes req.Body and then replaces it with a new [io.ReadCloser]
        that yields the same bytes. If DumpRequest returns an error,
        the state of req is undefined.
        
        The documentation for [http.Request.Write] details which fields
        of req are included in the dump.
    **/
    @:native("DumpRequest") static function dumpRequest(req: go.Pointer<go.net.http.Request>, body: Bool): (go.Result<go.Slice<go.Byte>>);
    /**
        DumpRequestOut is like [DumpRequest] but for outgoing client requests. It
        includes any headers that the standard [http.Transport] adds, such as
        User-Agent.
    **/
    @:native("DumpRequestOut") static function dumpRequestOut(req: go.Pointer<go.net.http.Request>, body: Bool): (go.Result<go.Slice<go.Byte>>);
    /**
        DumpResponse is like DumpRequest but dumps a response.
    **/
    @:native("DumpResponse") static function dumpResponse(resp: go.Pointer<go.net.http.Response>, body: Bool): (go.Result<go.Slice<go.Byte>>);
    /**
        NewChunkedReader returns a new chunkedReader that translates the data read from r
        out of HTTP "chunked" format before returning it.
        The chunkedReader returns [io.EOF] when the final 0-length chunk is read.
        
        NewChunkedReader is not needed by normal applications. The http package
        automatically decodes chunking when reading response bodies.
    **/
    @:native("NewChunkedReader") static function newChunkedReader(r: go.io.Reader): (go.io.Reader);
    /**
        NewChunkedWriter returns a new chunkedWriter that translates writes into HTTP
        "chunked" format before writing them to w. Closing the returned chunkedWriter
        sends the final 0-length chunk that marks the end of the stream but does
        not send the final CRLF that appears after trailers; trailers and the last
        CRLF must be written separately.
        
        NewChunkedWriter is not needed by normal applications. The http
        package adds chunking automatically if handlers don't set a
        Content-Length header. Using NewChunkedWriter inside a handler
        would result in double chunking or chunking with a Content-Length
        length, both of which are wrong.
    **/
    @:native("NewChunkedWriter") static function newChunkedWriter(w: go.io.Writer): (go.io.WriteCloser);
    /**
        NewClientConn is an artifact of Go's early HTTP implementation.
        It is low-level, old, and unused by Go's current HTTP stack.
        We should have deleted it before Go 1.
        
        Deprecated: Use the Client or Transport in package [net/http] instead.
    **/
    @:native("NewClientConn") static function newClientConn(c: go.net.Conn, r: go.Pointer<go.bufio.Reader>): (go.Pointer<go.net.http.httputil.ClientConn>);
    /**
        NewProxyClientConn is an artifact of Go's early HTTP implementation.
        It is low-level, old, and unused by Go's current HTTP stack.
        We should have deleted it before Go 1.
        
        Deprecated: Use the Client or Transport in package [net/http] instead.
    **/
    @:native("NewProxyClientConn") static function newProxyClientConn(c: go.net.Conn, r: go.Pointer<go.bufio.Reader>): (go.Pointer<go.net.http.httputil.ClientConn>);
    /**
        NewServerConn is an artifact of Go's early HTTP implementation.
        It is low-level, old, and unused by Go's current HTTP stack.
        We should have deleted it before Go 1.
        
        Deprecated: Use the Server in package [net/http] instead.
    **/
    @:native("NewServerConn") static function newServerConn(c: go.net.Conn, r: go.Pointer<go.bufio.Reader>): (go.Pointer<go.net.http.httputil.ServerConn>);
    /**
        NewSingleHostReverseProxy returns a new [ReverseProxy] that routes
        URLs to the scheme, host, and base path provided in target. If the
        target's path is "/base" and the incoming request was for "/dir",
        the target request will be for /base/dir.
        
        NewSingleHostReverseProxy does not rewrite the Host header.
        
        For backwards compatibility reasons, NewSingleHostReverseProxy
        returns a ReverseProxy using the deprecated Director function.
        This proxy preserves X-Forwarded-* headers sent by the client.
        
        To customize the ReverseProxy behavior beyond what
        NewSingleHostReverseProxy provides, use ReverseProxy directly
        with a Rewrite function. The ProxyRequest SetURL method
        may be used to route the outbound request. (Note that SetURL,
        unlike NewSingleHostReverseProxy, rewrites the Host header
        of the outbound request by default.)
        
        	proxy := &ReverseProxy{
        		Rewrite: func(r *ProxyRequest) {
        			r.SetURL(target)
        			r.Out.Host = r.In.Host // if desired
        		},
        	}
    **/
    @:native("NewSingleHostReverseProxy") static function newSingleHostReverseProxy(target: go.Pointer<go.net.url.URL>): (go.Pointer<go.net.http.httputil.ReverseProxy>);

}