package go.net.http;

/**
    RoundTripper is an interface representing the ability to execute a
    single HTTP transaction, obtaining the [Response] for a given [Request].
    
    A RoundTripper must be safe for concurrent use by multiple
    goroutines.
**/
@:go.Type({ name: "RoundTripper", instanceName: "http.RoundTripper", imports: ["net/http"] })
extern typedef RoundTripper = {

    @:native("RoundTrip") function roundTrip(p0: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);

}