package go.net.http;

@:structInit
@:go.Type({ name: "globalOptionsHandler", instanceName: "http.globalOptionsHandler", imports: ["net/http"] })
extern class GlobalOptionsHandler {

    @:native("ServeHTTP") function serveHTTP(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>): Void;

}