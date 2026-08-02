package go.net.http;

@:go.Type({ name: "genericClientConn", instanceName: "http.genericClientConn", imports: ["net/http"] })
extern typedef GenericClientConn = {

    @:native("Available") function available(): (go.GoInt);
    @:native("Close") function close(): (go.Error);
    @:native("Err") function err(): (go.Error);
    @:native("InFlight") function inFlight(): (go.GoInt);
    @:native("Release") function release(): Void;
    @:native("Reserve") function reserve(): (go.Error);
    @:native("RoundTrip") function roundTrip(req: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);

}