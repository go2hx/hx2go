package go.net.http.pprof;

@:go.Type({ name: "handler", instanceName: "pprof.handler", imports: ["net/http/pprof"] })
extern typedef Handler_ = haxe.extern.EitherType<String, {
    @:native("ServeHTTP") function serveHTTP(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>): Void;

}>