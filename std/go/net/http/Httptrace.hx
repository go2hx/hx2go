package go.net.http;

/**
    Package httptrace provides mechanisms to trace the events within
    HTTP client requests.
**/
@:go.Type({ name: "httptrace", instanceName: "httptrace.httptrace", imports: ["net/http/httptrace"] })
extern class Httptrace {

    /**
        ContextClientTrace returns the [ClientTrace] associated with the
        provided context. If none, it returns nil.
    **/
    @:native("ContextClientTrace") static function contextClientTrace(ctx: go.context.Context): (go.Pointer<go.net.http.httptrace.ClientTrace>);
    /**
        WithClientTrace returns a new context based on the provided parent
        ctx. HTTP client requests made with the returned context will use
        the provided trace hooks, in addition to any previous hooks
        registered with ctx. Any hooks defined in the provided trace will
        be called first.
    **/
    @:native("WithClientTrace") static function withClientTrace(ctx: go.context.Context, trace: go.Pointer<go.net.http.httptrace.ClientTrace>): (go.context.Context);

}