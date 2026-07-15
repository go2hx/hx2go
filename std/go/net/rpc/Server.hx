package go.net.rpc;

@:structInit
@:go.Type({ name: "Server", instanceName: "rpc.Server", imports: ["net/rpc"] })
extern class Server {

    @:native("Accept") function accept(lis: go.net.Listener): Void;
    @:native("HandleHTTP") function handleHTTP(rpcPath: String, debugPath: String): Void;
    @:native("Register") function register(rcvr: Dynamic): go.Error;
    @:native("RegisterName") function registerName(name: String, rcvr: Dynamic): go.Error;
    @:native("ServeCodec") function serveCodec(codec: go.net.rpc.ServerCodec): Void;
    @:native("ServeConn") function serveConn(conn: go.io.ReadWriteCloser): Void;
    @:native("ServeHTTP") function serveHTTP(w: go.net.http.ResponseWriter, req: go.Pointer<go.net.http.Request>): Void;
    @:native("ServeRequest") function serveRequest(codec: go.net.rpc.ServerCodec): go.Error;

}