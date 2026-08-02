package go.net.http;

@:go.Type({ name: "HandlerFunc", instanceName: "http.HandlerFunc", imports: ["net/http"] })
extern class HandlerFunc {

    @:native("ServeHTTP") function serveHTTP(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>): Void;

}