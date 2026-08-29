package go.net.http;

/**
    The CloseNotifier interface is implemented by ResponseWriters which
    allow detecting when the underlying connection has gone away.
    
    This mechanism can be used to cancel long operations on the server
    if the client has disconnected before the response is ready.
    
    Deprecated: the CloseNotifier interface predates Go's context package.
    New code should use [Request.Context] instead.
**/
@:go.Type({ name: "CloseNotifier", instanceName: "http.CloseNotifier", imports: ["net/http"] })
extern typedef CloseNotifier = {

    @:native("CloseNotify") function closeNotify(): (go.Chan<Bool>);

}