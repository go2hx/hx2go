package go.net.http;

@:structInit
@:go.Type({ name: "http3ServerHandler", instanceName: "http.http3ServerHandler", imports: ["net/http"] })
extern class Http3ServerHandler {

    @:native("Addr") function addr(): (String);
    @:native("BaseContext") function baseContext(): (go.context.Context);
    @:native("ListenErrHook") function listenErrHook(err: go.Error): Void;
    @:native("ServeHTTP") function serveHTTP(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>): Void;
    @:native("ShutdownContext") function shutdownContext(): (go.context.Context);
    @:native("TLSConfig") function tLSConfig(): (go.Pointer<go.crypto.tls.Config>);

}