package go.net.http;

/**
    A Handler responds to an HTTP request.
    
    [Handler.ServeHTTP] should write reply headers and data to the [ResponseWriter]
    and then return. Returning signals that the request is finished; it
    is not valid to use the [ResponseWriter] or read from the
    [Request.Body] after or concurrently with the completion of the
    ServeHTTP call.
    
    Depending on the HTTP client software, HTTP protocol version, and
    any intermediaries between the client and the Go server, it may not
    be possible to read from the [Request.Body] after writing to the
    [ResponseWriter]. Cautious handlers should read the [Request.Body]
    first, and then reply.
    
    Except for reading the body, handlers should not modify the
    provided Request.
    
    If ServeHTTP panics, the server (the caller of ServeHTTP) assumes
    that the effect of the panic was isolated to the active request.
    It recovers the panic, logs a stack trace to the server error log,
    and either closes the network connection or sends an HTTP/2
    RST_STREAM, depending on the HTTP protocol. To abort a handler so
    the client sees an interrupted response but the server doesn't log
    an error, panic with the value [ErrAbortHandler].
**/
@:go.Type({ name: "Handler", instanceName: "http.Handler", imports: ["net/http"] })
extern typedef Handler = {

    @:native("ServeHTTP") function serveHTTP(p0: go.net.http.ResponseWriter, p1: go.Pointer<go.net.http.Request>): Void;

}