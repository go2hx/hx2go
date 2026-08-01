package go.net.http;

@:structInit
@:go.Type({ name: "http2RoundTripOpt", instanceName: "http.http2RoundTripOpt", imports: ["net/http"] })
extern class Http2RoundTripOpt {

    @:native("OnlyCachedConn") var onlyCachedConn: Bool;

    function new(onlyCachedConn: Bool);

}