package go.net.http;

@:structInit
@:go.Type({ name: "ClientConn", instanceName: "http.ClientConn", imports: ["net/http"] })
extern class ClientConn {

    @:native("Available") function available(): go.GoInt;
    @:native("Close") function close(): go.Error;
    @:native("Err") function err(): go.Error;
    @:native("InFlight") function inFlight(): go.GoInt;
    @:native("Release") function release(): Void;
    @:native("Reserve") function reserve(): go.Error;
    @:native("RoundTrip") function roundTrip(req: go.Pointer<go.net.http.Request>): go.Result<go.Pointer<go.net.http.Response>>;
    @:native("SetStateHook") function setStateHook(f: (p0: go.Pointer<go.net.http.ClientConn>) -> Void): Void;

}