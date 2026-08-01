package go.net.http;

@:structInit
@:go.Type({ name: "fileHandler", instanceName: "http.fileHandler", imports: ["net/http"] })
extern class FileHandler {

    @:native("ServeHTTP") function serveHTTP(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>): Void;

}