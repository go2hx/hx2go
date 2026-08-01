package go.net.http;

@:go.Type({ name: "erringRoundTripper", instanceName: "http.erringRoundTripper", imports: ["net/http"] })
extern typedef ErringRoundTripper = {

    @:native("RoundTripErr") function roundTripErr(): (go.Error);

}