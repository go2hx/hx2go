package go.net.http;

@:structInit
@:go.Type({ name: "unencryptedHTTP2Request", instanceName: "http.unencryptedHTTP2Request", imports: ["net/http"] })
extern class UnencryptedHTTP2Request {

    @:native("BaseContext") function baseContext(): (go.context.Context);
    @:native("ServeHTTP") function serveHTTP(rw: go.net.http.ResponseWriter, req: go.Pointer<go.net.http.Request>): Void;

}