package go.net.http;

/**
    The HandlerFunc type is an adapter to allow the use of
    ordinary functions as HTTP handlers. If f is a function
    with the appropriate signature, HandlerFunc(f) is a
    [Handler] that calls f.
**/
@:go.Type({ name: "HandlerFunc", instanceName: "http.HandlerFunc", imports: ["net/http"] })
extern typedef HandlerFunc = haxe.extern.EitherType<(p0: go.net.http.ResponseWriter, p1: go.Pointer<go.net.http.Request>) -> Void, {
    /**
        ServeHTTP calls f(w, r).
    **/
    @:native("ServeHTTP") function serveHTTP(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>): Void;

}>