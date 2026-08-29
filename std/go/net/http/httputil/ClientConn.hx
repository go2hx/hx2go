package go.net.http.httputil;

/**
    ClientConn is an artifact of Go's early HTTP implementation.
    It is low-level, old, and unused by Go's current HTTP stack.
    We should have deleted it before Go 1.
    
    Deprecated: Use Client or Transport in package [net/http] instead.
**/
@:structInit
@:go.Type({ name: "ClientConn", instanceName: "httputil.ClientConn", imports: ["net/http/httputil"] })
extern class ClientConn {

    /**
        Close calls [ClientConn.Hijack] and then also closes the underlying connection.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Do is convenience method that writes a request and reads a response.
    **/
    @:native("Do") function _do(req: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);
    /**
        Hijack detaches the [ClientConn] and returns the underlying connection as well
        as the read-side bufio which may have some left over data. Hijack may be
        called before the user or Read have signaled the end of the keep-alive
        logic. The user should not call Hijack while [ClientConn.Read] or ClientConn.Write is in progress.
    **/
    @:go.Tuple("c", "r") @:native("Hijack") function hijack(): (go.Tuple<{ c: go.net.Conn, r: go.Pointer<go.bufio.Reader> }>);
    /**
        Pending returns the number of unanswered requests
        that have been sent on the connection.
    **/
    @:native("Pending") function pending(): (go.GoInt);
    /**
        Read reads the next response from the wire. A valid response might be
        returned together with an [ErrPersistEOF], which means that the remote
        requested that this be the last request serviced. Read can be called
        concurrently with [ClientConn.Write], but not with another Read.
    **/
    @:native("Read") function read(req: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);
    /**
        Write writes a request. An [ErrPersistEOF] error is returned if the connection
        has been closed in an HTTP keep-alive sense. If req.Close equals true, the
        keep-alive connection is logically closed after this request and the opposing
        server is informed. An ErrUnexpectedEOF indicates the remote closed the
        underlying TCP connection, which is usually considered as graceful close.
    **/
    @:native("Write") function write(req: go.Pointer<go.net.http.Request>): (go.Error);

}