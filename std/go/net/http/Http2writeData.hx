package go.net.http;

@:structInit
@:go.Type({ name: "http2writeData", instanceName: "http.http2writeData", imports: ["net/http"] })
extern class Http2writeData {

    @:native("String") function string(): (String);

}