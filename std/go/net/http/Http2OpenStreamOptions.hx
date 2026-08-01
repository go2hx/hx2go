package go.net.http;

@:structInit
@:go.Type({ name: "http2OpenStreamOptions", instanceName: "http.http2OpenStreamOptions", imports: ["net/http"] })
extern class Http2OpenStreamOptions {

    @:native("PusherID") var pusherID: go.UInt32;

    function new(pusherID: go.UInt32);

}