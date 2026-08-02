package go.net.http;

@:go.Type({ name: "Handler", instanceName: "http.Handler", imports: ["net/http"] })
extern typedef Handler = {

    @:native("ServeHTTP") function serveHTTP(p0: go.net.http.ResponseWriter, p1: go.Pointer<go.net.http.Request>): Void;

}