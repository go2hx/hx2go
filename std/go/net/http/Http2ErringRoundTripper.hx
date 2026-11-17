package go.net.http;

@:structInit
@:go.Type({ name: "http2ErringRoundTripper", instanceName: "http.http2ErringRoundTripper", imports: ["net/http"] })
extern class Http2ErringRoundTripper {

    @:native("RoundTrip") function roundTrip(p0: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);
    @:native("RoundTripErr") function roundTripErr(): (go.Error);

}