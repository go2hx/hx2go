package go.net.http;

@:structInit
@:go.Type({ name: "timeoutHandler", instanceName: "http.timeoutHandler", imports: ["net/http"] })
extern class TimeoutHandler_ {

    @:native("ServeHTTP") function serveHTTP(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>): Void;

}