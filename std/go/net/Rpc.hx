package go.net;

@:go.Type({ name: "rpc", instanceName: "rpc.rpc", imports: ["net/rpc"] })
extern class Rpc {

    @:native("DefaultDebugPath") static var DefaultDebugPath: String;
    @:native("DefaultRPCPath") static var DefaultRPCPath: String;

    @:native("DefaultServer") static var DefaultServer: go.Pointer<go.net.rpc.Server>;

    @:native("Accept") static function accept(lis: go.net.Listener): Void;
    @:native("Dial") static function dial(network: String, address: String): go.Result<go.Pointer<go.net.rpc.Client>>;
    @:native("DialHTTP") static function dialHTTP(network: String, address: String): go.Result<go.Pointer<go.net.rpc.Client>>;
    @:native("DialHTTPPath") static function dialHTTPPath(network: String, address: String, path: String): go.Result<go.Pointer<go.net.rpc.Client>>;
    @:native("HandleHTTP") static function handleHTTP(): Void;
    @:native("NewClient") static function newClient(conn: go.io.ReadWriteCloser): go.Pointer<go.net.rpc.Client>;
    @:native("NewClientWithCodec") static function newClientWithCodec(codec: go.net.rpc.ClientCodec): go.Pointer<go.net.rpc.Client>;
    @:native("NewServer") static function newServer(): go.Pointer<go.net.rpc.Server>;
    @:native("Register") static function register(rcvr: Dynamic): go.Error;
    @:native("RegisterName") static function registerName(name: String, rcvr: Dynamic): go.Error;
    @:native("ServeCodec") static function serveCodec(codec: go.net.rpc.ServerCodec): Void;
    @:native("ServeConn") static function serveConn(conn: go.io.ReadWriteCloser): Void;
    @:native("ServeRequest") static function serveRequest(codec: go.net.rpc.ServerCodec): go.Error;

}