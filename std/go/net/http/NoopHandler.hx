package go.net.http;

@:structInit
@:go.Type({ name: "noopHandler", instanceName: "http.noopHandler", imports: ["net/http"] })
extern class NoopHandler {

    @:native("ServeHTTP") function serveHTTP(p0: go.net.http.ResponseWriter, p1: go.Pointer<go.net.http.Request>): Void;

}