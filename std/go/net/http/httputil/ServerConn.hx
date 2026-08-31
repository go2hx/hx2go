package go.net.http.httputil;

/**
    ServerConn is an artifact of Go's early HTTP implementation.
    It is low-level, old, and unused by Go's current HTTP stack.
    We should have deleted it before Go 1.
    
    Deprecated: Use the Server in package [net/http] instead.
**/
@:structInit
@:go.Type({ name: "ServerConn", instanceName: "httputil.ServerConn", imports: ["net/http/httputil"] })
extern class ServerConn {

    /**
        Close calls [ServerConn.Hijack] and then also closes the underlying connection.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Hijack detaches the [ServerConn] and returns the underlying connection as well
        as the read-side bufio which may have some left over data. Hijack may be
        called before Read has signaled the end of the keep-alive logic. The user
        should not call Hijack while [ServerConn.Read] or [ServerConn.Write] is in progress.
    **/
    @:go.Tuple("p0", "p1") @:native("Hijack") function hijack(): (go.Tuple<{ p0: go.net.Conn, p1: go.Pointer<go.bufio.Reader> }>);
    /**
        Pending returns the number of unanswered requests
        that have been received on the connection.
    **/
    @:native("Pending") function pending(): (go.GoInt);
    /**
        Read returns the next request on the wire. An [ErrPersistEOF] is returned if
        it is gracefully determined that there are no more requests (e.g. after the
        first request on an HTTP/1.0 connection, or after a Connection:close on a
        HTTP/1.1 connection).
    **/
    @:native("Read") function read(): (go.Result<go.Pointer<go.net.http.Request>>);
    /**
        Write writes resp in response to req. To close the connection gracefully, set the
        Response.Close field to true. Write should be considered operational until
        it returns an error, regardless of any errors returned on the [ServerConn.Read] side.
    **/
    @:native("Write") function write(req: go.Pointer<go.net.http.Request>, resp: go.Pointer<go.net.http.Response>): (go.Error);

}