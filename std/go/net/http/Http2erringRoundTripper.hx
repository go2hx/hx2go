package go.net.http;

@:structInit
@:go.Type({ name: "http2erringRoundTripper", instanceName: "http.http2erringRoundTripper", imports: ["net/http"] })
extern class Http2erringRoundTripper {

    @:native("RoundTrip") function roundTrip(p0: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);
    @:native("RoundTripErr") function roundTripErr(): (go.Error);

}