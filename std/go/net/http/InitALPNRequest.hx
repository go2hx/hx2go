package go.net.http;

@:structInit
@:go.Type({ name: "initALPNRequest", instanceName: "http.initALPNRequest", imports: ["net/http"] })
extern class InitALPNRequest {

    @:native("BaseContext") function baseContext(): (go.context.Context);
    @:native("ServeHTTP") function serveHTTP(rw: go.net.http.ResponseWriter, req: go.Pointer<go.net.http.Request>): Void;

}