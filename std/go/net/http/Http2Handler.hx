package go.net.http;

@:structInit
@:go.Type({ name: "http2Handler", instanceName: "http.http2Handler", imports: ["net/http"] })
extern class Http2Handler {

    @:native("ServeHTTP") function serveHTTP(w: go.Pointer<go.net.http.internal.http2.ResponseWriter>, req: go.Pointer<Dynamic>): Void;

}