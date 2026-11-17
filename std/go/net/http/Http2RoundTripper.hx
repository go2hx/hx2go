package go.net.http;

@:structInit
@:go.Type({ name: "http2RoundTripper", instanceName: "http.http2RoundTripper", imports: ["net/http"] })
extern class Http2RoundTripper {

    @:native("RoundTrip") function roundTrip(req: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);

}