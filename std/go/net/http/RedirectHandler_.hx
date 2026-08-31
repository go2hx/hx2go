package go.net.http;

@:structInit
@:go.Type({ name: "redirectHandler", instanceName: "http.redirectHandler", imports: ["net/http"] })
extern class RedirectHandler_ {

    @:native("ServeHTTP") function serveHTTP(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>): Void;

}