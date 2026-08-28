package go.net.http;

/**
    A ClientConn is a client connection to an HTTP server.
    
    Unlike a [Transport], a ClientConn represents a single connection.
    Most users should use a Transport rather than creating client connections directly.
**/
@:structInit
@:go.Type({ name: "ClientConn", instanceName: "http.ClientConn", imports: ["net/http"] })
extern class ClientConn {

    /**
        Available reports the number of requests that may be sent
        to the connection without blocking.
        It returns 0 if the connection is closed.
    **/
    @:native("Available") function available(): (go.GoInt);
    /**
        Close closes the connection.
        Outstanding RoundTrip calls are interrupted.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Err reports any fatal connection errors.
        It returns nil if the connection is usable.
        If it returns non-nil, the connection can no longer be used.
    **/
    @:native("Err") function err(): (go.Error);
    /**
        InFlight reports the number of requests in flight,
        including reserved requests.
        It returns 0 if the connection is closed.
    **/
    @:native("InFlight") function inFlight(): (go.GoInt);
    /**
        Release releases an unused concurrency slot reserved by Reserve.
        If there are no reserved concurrency slots, it has no effect.
    **/
    @:native("Release") function release(): Void;
    /**
        Reserve reserves a concurrency slot on the connection.
        If Reserve returns nil, one additional RoundTrip call may be made
        without waiting for an existing request to complete.
        
        The reserved concurrency slot is accounted as an in-flight request.
        A successful call to RoundTrip will decrement the Available count
        and increment the InFlight count.
        
        Each successful call to Reserve should be followed by exactly one call
        to RoundTrip or Release, which will consume or release the reservation.
        
        If the connection is closed or at its concurrency limit,
        Reserve returns an error.
    **/
    @:native("Reserve") function reserve(): (go.Error);
    /**
        RoundTrip implements the [RoundTripper] interface.
        
        The request is sent on the client connection,
        regardless of the URL being requested or any proxy settings.
        
        If the connection is at its concurrency limit,
        RoundTrip waits for the connection to become available
        before sending the request.
    **/
    @:native("RoundTrip") function roundTrip(req: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);
    /**
        SetStateHook arranges for f to be called when the state of the connection changes.
        At most one call to f is made at a time.
        If the connection's state has changed since it was created,
        f is called immediately in a separate goroutine.
        f may be called synchronously from RoundTrip or Response.Body.Close.
        
        If SetStateHook is called multiple times, the new hook replaces the old one.
        If f is nil, no further calls will be made to f after SetStateHook returns.
        
        f is called when Available increases (more requests may be sent on the connection),
        InFlight decreases (existing requests complete), or Err begins returning non-nil
        (the connection is no longer usable).
    **/
    @:native("SetStateHook") function setStateHook(f: (p0: go.Pointer<go.net.http.ClientConn>) -> Void): Void;

}