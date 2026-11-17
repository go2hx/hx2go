package go.net.http;

@:go.Type({ name: "h2Transport", instanceName: "http.h2Transport", imports: ["net/http"] })
extern typedef H2Transport = {

    @:native("CloseIdleConnections") function closeIdleConnections(): Void;

}