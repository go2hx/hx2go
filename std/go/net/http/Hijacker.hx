package go.net.http;

/**
    The Hijacker interface is implemented by ResponseWriters that allow
    an HTTP handler to take over the connection.
    
    The default [ResponseWriter] for HTTP/1.x connections supports
    Hijacker, but HTTP/2 connections intentionally do not.
    ResponseWriter wrappers may also not support Hijacker. Handlers
    should always test for this ability at runtime.
**/
@:go.Type({ name: "Hijacker", instanceName: "http.Hijacker", imports: ["net/http"] })
extern typedef Hijacker = {

    @:go.Tuple("p0", "p1", "p2") @:native("Hijack") function hijack(): (go.Tuple<{ p0: go.net.Conn, p1: go.Pointer<go.bufio.ReadWriter>, p2: go.Error }>);

}