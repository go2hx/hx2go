package go.net.http;

@:structInit
@:go.Type({ name: "http2ClientConn", instanceName: "http.http2ClientConn", imports: ["net/http"] })
extern class Http2ClientConn {

    @:native("NetHTTPClientConn") var netHTTPClientConn: Dynamic;

    function new(netHTTPClientConn: Dynamic);

    @:native("Available") function available(): (go.GoInt);
    @:native("Close") function close(): (go.Error);
    @:native("Err") function err(): (go.Error);
    @:native("InFlight") function inFlight(): (go.GoInt);
    @:native("Ping") function ping(ctx: go.context.Context): (go.Error);
    @:native("Release") function release(): Void;
    @:native("Reserve") function reserve(): (go.Error);
    @:native("RoundTrip") function roundTrip(req: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);

}