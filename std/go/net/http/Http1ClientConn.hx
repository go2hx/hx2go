package go.net.http;

@:structInit
@:go.Type({ name: "http1ClientConn", instanceName: "http.http1ClientConn", imports: ["net/http"] })
extern class Http1ClientConn {

    @:native("Available") function available(): (go.GoInt);
    @:native("Close") function close(): (go.Error);
    @:native("Err") function err(): (go.Error);
    @:native("InFlight") function inFlight(): (go.GoInt);
    @:native("Release") function release(): Void;
    @:native("Reserve") function reserve(): (go.Error);
    @:native("RoundTrip") function roundTrip(req: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);

}