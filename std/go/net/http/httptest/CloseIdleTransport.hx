package go.net.http.httptest;

@:go.Type({ name: "closeIdleTransport", instanceName: "httptest.closeIdleTransport", imports: ["net/http/httptest"] })
extern typedef CloseIdleTransport = {

    @:native("CloseIdleConnections") function closeIdleConnections(): Void;

}