package go.net.http;

@:structInit
@:go.Type({ name: "http2Handler", instanceName: "http.http2Handler", imports: ["net/http"] })
extern class Http2Handler {

    @:native("ServeHTTP") function serveHTTP(w: go.Pointer<Dynamic>, req: go.Pointer<Dynamic>): Void;

}