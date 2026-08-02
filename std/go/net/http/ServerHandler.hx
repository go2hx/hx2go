package go.net.http;

@:structInit
@:go.Type({ name: "serverHandler", instanceName: "http.serverHandler", imports: ["net/http"] })
extern class ServerHandler {

    @:native("ServeHTTP") function serveHTTP(rw: go.net.http.ResponseWriter, req: go.Pointer<go.net.http.Request>): Void;

}