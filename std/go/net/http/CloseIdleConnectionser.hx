package go.net.http;

@:go.Type({ name: "closeIdleConnectionser", instanceName: "http.closeIdleConnectionser", imports: ["net/http"] })
extern typedef CloseIdleConnectionser = {

    @:native("CloseIdleConnections") function closeIdleConnections(): Void;

}