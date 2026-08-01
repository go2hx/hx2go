package go.net.http;

@:structInit
@:go.Type({ name: "http2clientStream", instanceName: "http.http2clientStream", imports: ["net/http"] })
extern class Http2clientStream {

    @:native("ID") var ID: go.UInt32;

    function new(ID: go.UInt32);

}