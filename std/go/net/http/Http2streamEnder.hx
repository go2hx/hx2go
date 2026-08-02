package go.net.http;

@:go.Type({ name: "http2streamEnder", instanceName: "http.http2streamEnder", imports: ["net/http"] })
extern typedef Http2streamEnder = {

    @:native("StreamEnded") function streamEnded(): (Bool);

}