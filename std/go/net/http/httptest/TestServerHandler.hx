package go.net.http.httptest;

@:structInit
@:go.Type({ name: "testServerHandler", instanceName: "httptest.testServerHandler", imports: ["net/http/httptest"] })
extern class TestServerHandler {

    @:native("ServeHTTP") function serveHTTP(w: go.net.http.ResponseWriter, req: go.Pointer<go.net.http.Request>): Void;

}