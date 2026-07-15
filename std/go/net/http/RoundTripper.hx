package go.net.http;

@:go.Type({ name: "RoundTripper", instanceName: "http.RoundTripper", imports: ["net/http"] })
extern typedef RoundTripper = {

    @:native("RoundTrip") function roundTrip(p0: go.Pointer<go.net.http.Request>): go.Result<go.Pointer<go.net.http.Response>>;

}