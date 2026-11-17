package go.net.http;

@:go.Type({ name: "http2Configer", instanceName: "http.http2Configer", imports: ["net/http"] })
extern typedef Http2Configer = {

    @:native("HTTP2Config") function hTTP2Config(): (go.net.http.HTTP2Config);

}