package go.net.http;

@:structInit
@:go.Type({ name: "ServeMux", instanceName: "http.ServeMux", imports: ["net/http"] })
extern class ServeMux {

    @:native("Handle") function handle(pattern: String, handler: go.net.http.Handler): Void;
    @:native("HandleFunc") function handleFunc(pattern: String, handler: (p0: go.net.http.ResponseWriter, p1: go.Pointer<go.net.http.Request>) -> Void): Void;
    @:go.Tuple("h", "pattern") @:native("Handler") function handler(r: go.Pointer<go.net.http.Request>): go.Tuple<{ h: go.net.http.Handler, pattern: String }>;
    @:native("ServeHTTP") function serveHTTP(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>): Void;

}